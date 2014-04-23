package actions;

import interceptors.UserAware;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import model.SessionUser;
import model.UserRoles;

import com.opensymphony.xwork2.ActionSupport;

import db.billingdb.dao.custom.impl.InvoiceReportDAO;
import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.model.custom.Customer;
import db.billingdb.model.custom.InvoiceCondition;
import db.billingdb.model.custom.InvoiceReport;
import db.billingdb.model.custom.Item;
import db.billingdb.model.custom.ItemReport;
import db.billingdb.model.custom.ItemReportCondition;
import db.billingdb.model.custom.SimpleUser;

public class ReportingAction extends ActionSupport implements UserAware {

	/**
	 * generated serial Version UID for serialization
	 */
	private static final long serialVersionUID = 866767945016267932L;

	public static final String CITY_PREFIX = "city.";
	private String page = "reporting";
	private SessionUser sessionUser;

	private List<String> cities = new ArrayList<String>();
	private List<Item> items;
	private List<Customer> customers;
	private List<SimpleUser> partners;
	private List<SimpleUser> salesmen;
	
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
		
		//TODO: Remove this. Only for testing !
		sessionUser = new SessionUser();
		sessionUser.setRole(UserRoles.Admin);
		sessionUser.setName("Ali");
		sessionUser.setCity(1);
	}
	
	public String execute() {
		page = "other";
		prepareLists();
		return SUCCESS;
	}
	
	public String prepareInvoicePage() {
		this.page = "invoice";
		prepareLists();
		return SUCCESS;
	}
	
	public String prepareUserPage() {
		this.page = "user";
		prepareLists();
		return SUCCESS;
	}

	public String preparePaymentPage() {
		this.page = "payment";
		prepareLists();
		return SUCCESS;
	}

	@Override
	public void setUser(SessionUser user) {
		this.sessionUser = user;
	}

	public List<String> getCities() {
		return cities;
	}

	public List<Item> getItems() {
		return items;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public List<SimpleUser> getPartners() {
		return partners;
	}

	public List<SimpleUser> getSalesmen() {
		return salesmen;
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

	public String getPage() {
		return this.page;
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

	private void prepareLists() {

		boolean cityLimit = sessionUser.getRole() == UserRoles.Manager;

		prepareCities();
		items = ListProvider.getItemList(true);
		customers = ListProvider.getCustomerList(
				cityLimit ? sessionUser.getCity() : 0, true);
		partners = ListProvider.getPartnerList(cityLimit ? sessionUser.getCity() : 0, true);
		salesmen = ListProvider.getSalesmanList(cityLimit ? sessionUser.getCity() : 0, true);
		
	}
}
