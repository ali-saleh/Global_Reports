package actions.reports;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import actions.ListProvider;

import com.opensymphony.xwork2.ActionSupport;

import db.billingdb.dao.custom.impl.InvoiceReportDAO;
import db.billingdb.model.custom.InvoiceCondition;
import db.billingdb.model.custom.InvoiceReport;
import db.billingdb.model.custom.Item;

public class InvoiceReportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3666037000009359327L;

	private static final String CITY_PREFIX = "city.";

	private List<InvoiceReport> invoicesDollar;
	private List<InvoiceReport> invoicesShekel;
	private List<InvoiceReport> invoicesDollarDeleted;
	private List<InvoiceReport> invoicesShekelDeleted;

	private int selectedCity;
	private String city;
	private int currencyId;
	private String currency;
	private List<Integer> selectedItems;
	private List<String> itemNames = new ArrayList<String>();

	private String fromDate;
	private String toDate;
	private boolean vatSelect;
	private boolean invoicePaid;
	private boolean invoiceUnPaid;
	private boolean invoiceDeleted;

	@Override
	public String execute() throws Exception {

		InvoiceReportDAO dao = new InvoiceReportDAO();
		InvoiceCondition condition = new InvoiceCondition();

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
		// Currency setting
		if((this.currencyId & 1) == 1) {
			condition.setCurrencyId(1);
			this.invoicesDollar = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			if(invoiceDeleted) {
				condition.setDeleted(true);
				this.invoicesDollarDeleted = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			}
		}
		condition.setDeleted(false);
		if((this.currencyId & 2) == 2) {
			condition.setCurrencyId(12);
			this.invoicesShekel = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			if(invoiceDeleted) {
				condition.setDeleted(true);
				this.invoicesShekelDeleted = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			}
		}
		
		return SUCCESS;
	}

	public List<InvoiceReport> getInvoicesDollar() {
		return invoicesDollar;
	}
	
	public List<InvoiceReport> getInvoicesShekel() {
		return invoicesShekel;
	}
	
	public List<InvoiceReport> getInvoicesDollarDeleted() {
		return invoicesDollarDeleted;
	}
	
	public List<InvoiceReport> getInvoicesShekelDeleted() {
		return invoicesShekelDeleted;
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

	public List<Integer> getSelectedItems() {
		return selectedItems;
	}

	public void setSelectedItems(List<Integer> selectedItems) {
		this.selectedItems = selectedItems;
		for (Integer x : this.selectedItems) {
			for (Item i : ListProvider.getItemList()) {
				if (i.getId() == x) {
					this.getItemNames().add(i.getDesc());
					break;
				}
			}
		}
	}

	public List<String> getItemNames() {
		return itemNames;
	}

	public void setItemNames(List<String> itemNames) {
		this.itemNames = itemNames;
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
	
	public boolean isInvoicePaid() {
		return invoicePaid;
	}

	public void setInvoicePaid(boolean invoicePaid) {
		this.invoicePaid = invoicePaid;
	}

	public boolean isInvoiceUnPaid() {
		return invoiceUnPaid;
	}

	public void setInvoiceUnPaid(boolean invoiceUnPaid) {
		this.invoiceUnPaid = invoiceUnPaid;
	}

	public boolean isInvoiceDeleted() {
		return invoiceDeleted;
	}

	public void setInvoiceDeleted(boolean invoiceDeleted) {
		this.invoiceDeleted = invoiceDeleted;
	}

	private String convertDateFormat(String date) {
		String[] parts = date.split("/");

		ArrayUtils.reverse(parts);

		return StringUtils.join(parts, '-');
	}
	
//	void test() {
//		this.invoices = new ArrayList<InvoiceReport>();
//		int i = 0;
//		while (i < 20) {
//			InvoiceReport x = new InvoiceReport();
//			x.setCreateDate(Date.valueOf("2012-3-1"));
//			x.setUserFullName("test user");
//			x.setInvoiceId(100);
//			x.setTotal(500.0);
//			this.invoices.add(x);
//			
//			i++;
//		}
//	}
}
