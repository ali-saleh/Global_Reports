package actions.reports;

import java.sql.Date;
import java.util.List;

import db.billingdb.dao.custom.impl.PaymentReportDAO;
import db.billingdb.model.custom.PaymentCondition;
import db.billingdb.model.custom.PaymentReport;

public class PaymentReportAction extends BaseReportAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3658601084297768667L;
	
	private List<PaymentReport> paymentsDollarCash;
	private List<PaymentReport> paymentsDollarCheque;
	private List<PaymentReport> paymentsShekelCash;
	private List<PaymentReport> paymentsShekelCheque;
	private List<PaymentReport> paymentsDollarCashDeleted;
	private List<PaymentReport> paymentsDollarChequeDeleted;
	private List<PaymentReport> paymentsShekelCashDeleted;
	private List<PaymentReport> paymentsShekelChequeDeleted;
	
	private int paymentMethodId;
	
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
		
		if (isPrint != null) {
			return PRINT;
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

	public int getPaymentMethodId() {
		return paymentMethodId;
	}

	public void setPaymentMethodId(int paymentMethodId) {
		this.paymentMethodId = paymentMethodId;
	}
	
	public boolean isShowDeleted() {
		return showDeleted;
	}

	public void setShowDeleted(boolean showDeleted) {
		this.showDeleted = showDeleted;
	}
}
