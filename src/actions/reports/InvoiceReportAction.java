package actions.reports;

import java.sql.Date;
import java.util.List;

import db.billingdb.dao.custom.impl.InvoiceReportDAO;
import db.billingdb.model.custom.InvoiceCondition;
import db.billingdb.model.custom.InvoiceReport;


public class InvoiceReportAction extends BaseReportAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6342410377606008436L;

	private List<InvoiceReport> invoicesDollarPaid;
	private List<InvoiceReport> invoicesDollarUnPaid;
	private List<InvoiceReport> invoicesShekelPaid;
	private List<InvoiceReport> invoicesShekelUnPaid;
	private List<InvoiceReport> invoicesDollarDeleted;
	private List<InvoiceReport> invoicesShekelDeleted;

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
			if(invoicePaid) {
				condition.setInvoiceState(26);
				this.invoicesDollarPaid = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			}
			if(invoiceUnPaid) { 
				condition.setInvoiceState(27);
				this.invoicesDollarUnPaid = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			}
			if(invoiceDeleted) {
				condition.setDeleted(true);
				this.invoicesDollarDeleted = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			}
		}
		condition.setDeleted(false);
		if((this.currencyId & 2) == 2) {
			condition.setCurrencyId(12);
			if(invoicePaid) {
				condition.setInvoiceState(26);
				this.invoicesDollarPaid = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			}
			if(invoiceUnPaid) { 
				condition.setInvoiceState(27);
				this.invoicesDollarUnPaid = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			}
			if(invoiceDeleted) {
				condition.setDeleted(true);
				this.invoicesShekelDeleted = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));
			}
		}
		
		if(isPrint != null)
			return PRINT;
		
		return SUCCESS;
	}

	public List<InvoiceReport> getInvoicesDollarPaid() {
		return invoicesDollarPaid;
	}
	
	public List<InvoiceReport> getInvoicesDollarUnPaid() {
		return invoicesDollarUnPaid;
	}
	
	public List<InvoiceReport> getInvoicesShekelPaid() {
		return invoicesShekelPaid;
	}
	
	public List<InvoiceReport> getInvoicesShekelUnPaid() {
		return invoicesShekelUnPaid;
	}
	
	public List<InvoiceReport> getInvoicesDollarDeleted() {
		return invoicesDollarDeleted;
	}
	
	public List<InvoiceReport> getInvoicesShekelDeleted() {
		return invoicesShekelDeleted;
	}

	public double getInvoiceDollarPaidSum() {
		double sum = 0.0;
		for(InvoiceReport i : invoicesDollarPaid) {
			sum += i.getTotal();
		}
		return sum;
	}
	
	public double getInvoiceDollarUnPaidSum() {
		double sum = 0.0;
		for(InvoiceReport i : invoicesDollarUnPaid) {
			sum += i.getTotal();
		}
		return sum;
	}

	public double getInvoiceDollarDeletedSum() {
		double sum = 0.0;
		for(InvoiceReport i : invoicesDollarDeleted) {
			sum += i.getTotal();
		}
		return sum;
	}

	public double getInvoiceShekelPaidSum() {
		double sum = 0.0;
		for(InvoiceReport i : invoicesShekelPaid) {
			sum += i.getTotal();
		}
		return sum;
	}
	
	public double getInvoiceShekelUnPaidSum() {
		double sum = 0.0;
		for(InvoiceReport i : invoicesShekelUnPaid) {
			sum += i.getTotal();
		}
		return sum;
	}

	public double getInvoiceShekelDeletedSum() {
		double sum = 0.0;
		for(InvoiceReport i : invoicesShekelDeleted) {
			sum += i.getTotal();
		}
		return sum;
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
