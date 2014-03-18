package actions;

import interceptors.UserAware;

import java.util.ArrayList;
import java.util.List;

import model.SessionUser;

import com.opensymphony.xwork2.ActionSupport;

import db.billingdb.dao.custom.impl.InvoiceReportDAO;
import db.billingdb.model.custom.InvoiceCondition;
import db.billingdb.model.custom.InvoiceReport;

public class ReportingAction extends ActionSupport implements UserAware {

	/**
	 * generated serial Version UID for serialization
	 */
	private static final long serialVersionUID = 866767945016267932L;
	
	private List<String> cities = new ArrayList<String>();
	private static final String CITY_PREFIX = "city.";
	private List<InvoiceReport> invoices;
	private int selectedCity;
	
	public void setInvoices(List<InvoiceReport> invoices) {
		this.invoices = invoices;
	}

	public int getSelectedCity() {
		return selectedCity;
	}

	public void setSelectedCity(int selectedCity) {
		this.selectedCity = selectedCity;
	}

	public ReportingAction() {
		prepareCities();
	}

	public List<String> getCities() {
		return cities;
	}

	public void setCities(List<String> cities) {
		this.cities = cities;
	}

	void prepareCities() {
		if (cities.size() == 0) {
			int size = 0;
			while (true) {
				String name;
				if ((name = getText(CITY_PREFIX + size++, "")).isEmpty())
					break;
				cities.add(name);
			}
		}
	}

	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String getInvoiceReport() {
		
		InvoiceReportDAO dao = new InvoiceReportDAO();
		InvoiceCondition condition = new InvoiceCondition();
		condition.setCity(selectedCity);
		this.invoices = dao.getInvoicesByCondition(condition);
		InvoiceReport invoiceReport = invoices.get(0);
		invoiceReport.setDisply_name("<br><b>"+invoiceReport.getDisply_name()+"</b>");
		invoices.set(0,invoiceReport);
		return SUCCESS;
	}

	public List<InvoiceReport> getInvoices() {
		return invoices;
	}

	@Override
	public void setUser(SessionUser user) {
		// TODO Auto-generated method stub

	}
}
