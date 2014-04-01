package actions;

import interceptors.UserAware;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import model.SessionUser;

import com.opensymphony.xwork2.ActionSupport;

import db.billingdb.dao.custom.impl.InvoiceReportDAO;
import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.model.custom.InvoiceCondition;
import db.billingdb.model.custom.InvoiceReport;
import db.billingdb.model.custom.Item;
import db.billingdb.model.custom.ItemReport;
import db.billingdb.model.custom.ItemReportCondition;

public class ReportingAction extends ActionSupport implements UserAware {

	/**
	 * generated serial Version UID for serialization
	 */
	private static final long serialVersionUID = 866767945016267932L;

	private static final String CITY_PREFIX = "city.";

	private List<InvoiceReport> invoices;

	private List<ItemReport> services;

	private List<String> cities = new ArrayList<String>();
	private List<Item> items;
	private int selectedCity;

	private String city;

	private int currencyId;
	private String currency;
	private List<Integer> selectedItems;
	private List<String> itemNames = new ArrayList<String>();

	private String fromDate;
	private String toDate;
	private boolean vatSelect;

	public ReportingAction() {
		prepareCities();
		items = ListProvider.getItemList();
	}

	public String execute() throws Exception {
		return SUCCESS;
	}

	@Override
	public void setUser(SessionUser user) {
		// TODO Auto-generated method stub
	}

	public String getInvoiceReport() {

		InvoiceReportDAO dao = new InvoiceReportDAO();
		InvoiceCondition condition = new InvoiceCondition();

		if (selectedCity != 0)
			condition.setCity(selectedCity);
		if (fromDate != null && !fromDate.isEmpty())
			condition.setStartDate(Date.valueOf(convertDateFormat(fromDate)));
		if (toDate != null && !toDate.isEmpty())
			condition.setEndDate(Date.valueOf(convertDateFormat(toDate)));
		// if (selectedItem != 0)
		// condition.setItemId(selectedItem);
		if (!vatSelect)
			condition.setVatRate(1.0); // Note: this value is just !0 and will
										// be overridden

		this.invoices = dao.getInvoicesByIDs(dao.getInvoicesIDs(condition));

		return SUCCESS;
	}

	public String getServiceReport() {
		ItemReportDAO dao = new ItemReportDAO();
		ItemReportCondition condition = new ItemReportCondition();

		if (selectedCity != 0)
			condition.setCity(selectedCity);
		if (fromDate != null && !fromDate.isEmpty())
			condition.setStartDate(Date.valueOf(convertDateFormat(fromDate)));
		if (toDate != null && !toDate.isEmpty())
			condition.setEndDate(Date.valueOf(convertDateFormat(toDate)));
		// if (selectedItem != 0)
		// condition.setItemId(selectedItem);
		if (!vatSelect)
			condition.setVatRate(1.0); // Note: this value is just !0 and will
										// be overridden

		this.setServices(dao.getItemReport(condition));

		return SUCCESS;
	}

	public List<InvoiceReport> getInvoices() {
		return invoices;
	}

	public List<ItemReport> getServices() {
		return services;
	}

	public void setServices(List<ItemReport> services) {
		this.services = services;
	}

	public List<String> getCities() {
		return cities;
	}

	public List<Item> getItems() {
		return items;
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
			for (Item i : items) {
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

	private void prepareCities() {
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

	private String convertDateFormat(String date) {
		String[] parts = date.split("/");

		ArrayUtils.reverse(parts);

		return StringUtils.join(parts, '-');
	}
}
