package actions.reports;

import java.sql.Date;
import java.util.List;

import actions.BaseAction;

import db.billingdb.dao.custom.impl.PaymentReportDAO;
import db.billingdb.model.custom.PaymentCondition;
import db.billingdb.model.custom.PaymentReport;

public class PaymentReportAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3658601084297768667L;
	
	private static final String CITY_PREFIX = "city.";
	
	private List<PaymentReport> paymentsDollarCash;
	private List<PaymentReport> paymentsDollarCheque;
	private List<PaymentReport> paymentsShekelCash;
	private List<PaymentReport> paymentsShekelCheque;
	private List<PaymentReport> paymentsDollarCashDeleted;
	private List<PaymentReport> paymentsDollarChequeDeleted;
	private List<PaymentReport> paymentsShekelCashDeleted;
	private List<PaymentReport> paymentsShekelChequeDeleted;
	
	private int selectedCity;
	private String city;
	private int currencyId;
	private String currency;
	private int paymentMethodId;
	
	private String fromDate;
	private String toDate;
	private boolean vatSelect;
	private boolean showDeleted;
	
	@Override
	public String execute() throws Exception {

		PaymentReportDAO dao = new PaymentReportDAO();
		PaymentCondition condition = new PaymentCondition();

		// City setting
		if (selectedCity != 0)
			condition.setCity(selectedCity);

		// From date validation
		if (fromDate != null && !fromDate.isEmpty())
			condition.setStartDate(Date.valueOf(convertDateFormat(fromDate)));
		// To date validation
		if (toDate != null && !toDate.isEmpty())
			condition.setEndDate(Date.valueOf(convertDateFormat(toDate)));
		
		if (!vatSelect)
			condition.setVatRate(1.0); // Note: this value is just !0 and will
										// be overridden
		
		// Payment method
		//Cheques 
		if ((paymentMethodId & 1) == 1) {
			condition.setPaymentMethod(1); //cheque
			if((this.currencyId & 1) == 1) {
				condition.setCurrencyId(1);
				this.paymentsDollarCheque = dao.getPayments(condition);
				if(showDeleted) {
					condition.setDeleted(true);
					this.paymentsDollarChequeDeleted = dao.getPayments(condition);
				}
				condition.setDeleted(false);
			}
			if((this.currencyId & 2) == 2) {
				condition.setCurrencyId(12);
				this.paymentsShekelCheque = dao.getPayments(condition);
				if(showDeleted) {
					condition.setDeleted(true);
					this.paymentsShekelChequeDeleted = dao.getPayments(condition);
				}
				condition.setDeleted(false);
			}
		}
		
		//Cash
		if ((paymentMethodId & 2) == 2) {
			condition.setPaymentMethod(10); //cash
			if((this.currencyId & 1) == 1) {
				condition.setCurrencyId(1);
				this.paymentsDollarCash = dao.getPayments(condition);
				if(showDeleted) {
					condition.setDeleted(true);
					this.paymentsDollarCashDeleted = dao.getPayments(condition);
				}
				condition.setDeleted(false);
			}
			if((this.currencyId & 2) == 2) {
				condition.setCurrencyId(12);
				this.paymentsShekelCash = dao.getPayments(condition);
				if(showDeleted) {
					condition.setDeleted(true);
					this.paymentsShekelCashDeleted = dao.getPayments(condition);
				}
			}
		}
		
		return SUCCESS;
	}
	
	public List<PaymentReport> getPaymentsDollarCash() {
		return paymentsDollarCash;
	}

	public List<PaymentReport> getPaymentsDollarCheque() {
		return paymentsDollarCheque;
	}

	public List<PaymentReport> getPaymentsShekelCash() {
		return paymentsShekelCash;
	}

	public List<PaymentReport> getPaymentsShekelCheque() {
		return paymentsShekelCheque;
	}

	public List<PaymentReport> getPaymentsDollarCashDeleted() {
		return paymentsDollarCashDeleted;
	}

	public List<PaymentReport> getPaymentsDollarChequeDeleted() {
		return paymentsDollarChequeDeleted;
	}

	public List<PaymentReport> getPaymentsShekelCashDeleted() {
		return paymentsShekelCashDeleted;
	}

	public List<PaymentReport> getPaymentsShekelChequeDeleted() {
		return paymentsShekelChequeDeleted;
	}
	
	public double getPaymentsDollarCashSum() {
		double sum = 0;
		for(PaymentReport p : this.paymentsDollarCash) {
			sum += p.getAmount();
		}
		return sum;
	}
	
	public double getPaymentsDollarChequeSum() {
		double sum = 0;
		for(PaymentReport p : this.paymentsDollarCheque) {
			sum += p.getAmount();
		}
		return sum;
	}

	public double getPaymentsShekelCashSum() {
		double sum = 0;
		for(PaymentReport p : this.paymentsShekelCash) {
			sum += p.getAmount();
		}
		return sum;
	}
	
	public double getPaymentsShekelChequeSum() {
		double sum = 0;
		for(PaymentReport p : this.paymentsShekelCheque) {
			sum += p.getAmount();
		}
		return sum;
	}

	public double getPaymentsDollarCashDeletedSum() {
		double sum = 0;
		for(PaymentReport p : this.paymentsDollarCashDeleted) {
			sum += p.getAmount();
		}
		return sum;
	}
	
	public double getPaymentsDollarChequeDeletedSum() {
		double sum = 0;
		for(PaymentReport p : this.paymentsDollarChequeDeleted) {
			sum += p.getAmount();
		}
		return sum;
	}

	public double getPaymentsShekelCashDeletedSum() {
		double sum = 0;
		for(PaymentReport p : this.paymentsShekelCashDeleted) {
			sum += p.getAmount();
		}
		return sum;
	}
	
	public double getPaymentsShekelChequeDeletedSum() {
		double sum = 0;
		for(PaymentReport p : this.paymentsShekelChequeDeleted) {
			sum += p.getAmount();
		}
		return sum;
	}

	public int getSelectedCity() {
		return selectedCity;
	}

	public void setSelectedCity(int selectedCity) {
		this.selectedCity = selectedCity;
		this.setCity(getText(CITY_PREFIX + selectedCity, ""));
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getCurrencyId() {
		return currencyId;
	}

	public void setCurrencyId(int currencyId) {
		this.currencyId = currencyId;
		switch (this.currencyId) {
		case 1:
			setCurrency(getText("report.report.both.currencies", ""));
			break;
		case 2:
			setCurrency(getText("report.report.dollar", ""));
			break;
		case 3:
			setCurrency(getText("report.report.shekel", ""));
			break;

		default:
			break;
		}
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}
	
	public int getPaymentMethodId() {
		return paymentMethodId;
	}

	public void setPaymentMethodId(int paymentMethodId) {
		this.paymentMethodId = paymentMethodId;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public boolean isVatSelect() {
		return vatSelect;
	}

	public void setVatSelect(boolean vatSelect) {
		this.vatSelect = vatSelect;
	}
	
	public boolean isShowDeleted() {
		return showDeleted;
	}

	public void setShowDeleted(boolean showDeleted) {
		this.showDeleted = showDeleted;
	}
}
