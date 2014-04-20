package actions.reports;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import actions.ListProvider;
import actions.ReportingAction;

import com.opensymphony.xwork2.ActionSupport;

import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.dao.custom.impl.UserReportDAO;
import db.billingdb.model.custom.Item;
import db.billingdb.model.custom.ItemReport;
import db.billingdb.model.custom.ItemReportCondition;
import db.billingdb.model.custom.OutstandingUser;
import db.billingdb.model.custom.OutstandingUserCondition;
import db.billingdb.model.custom.info.UserInfo;

public class UserReportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9010796324682946356L;

	private String page = "user";

	private List<OutstandingUser> outstandingDollar;
	private List<OutstandingUser> outstandingShekel;
	private List<OutstandingUser> outstandingDollarDeleted;
	private List<OutstandingUser> outstandingShekelDeleted;
	
	List<ItemReport> serviceReport;

	private int selectedCity;
	private String city;
	private List<Integer> selectedItems;
	private List<String> itemNames = new ArrayList<String>();
	private int currencyId;
	private String currency;
	private int selectedUser;
	private boolean vatSelect;

	private boolean showDeletedUsers;

	// For Testing
	private InputStream inputStream;
	private String search;
	private String res;

	private String greeting;

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String outstandingReport() {

		OutstandingUserCondition condition = new OutstandingUserCondition();
		UserReportDAO dao = new UserReportDAO();
		if (selectedCity != 0) {
			condition.setCity(selectedCity);
		}

		// Currency setting
		if ((this.currencyId & 1) == 1) {
			condition.setCurrencyId(1);
			this.outstandingDollar = fillUserInfo(dao, dao.getOutstandingUsers(condition));
			if (showDeletedUsers) {
				condition.setDeleted(true);
				this.outstandingDollarDeleted = fillUserInfo(dao, dao.getOutstandingUsers(condition));
			}
		}
		condition.setDeleted(false);
		if ((this.currencyId & 2) == 2) {
			condition.setCurrencyId(12);
			this.outstandingShekel = fillUserInfo(dao, dao.getOutstandingUsers(condition));
			if (showDeletedUsers) {
				condition.setDeleted(true);
				this.outstandingShekelDeleted = fillUserInfo(dao, dao.getOutstandingUsers(condition));
			}
		}

		return SUCCESS;
	}

	public String userServiceReport() {

		ItemReportDAO dao = new ItemReportDAO();
		ItemReportCondition condition = new ItemReportCondition();
		
		// Item selection
		if (selectedItems != null && selectedItems.size() > 0) {
			condition.setItemIds(selectedItems);
		}
		
		// Specific User
		if (selectedUser != 0 ) {
			condition.setUserId(selectedUser);
		}
		
		if (!vatSelect)
			condition.setVatRate(1.0); // Note: this value is just !0 and will
										// be overridden
		serviceReport = dao.getItemReport(condition);

		return SUCCESS;
	}

	public List<OutstandingUser> getOutstandingDollar() {
		return outstandingDollar;
	}

	public List<OutstandingUser> getOutstandingShekel() {
		return outstandingShekel;
	}

	public List<OutstandingUser> getOutstandingDollarDeleted() {
		return outstandingDollarDeleted;
	}

	public List<OutstandingUser> getOutstandingShekelDeleted() {
		return outstandingShekelDeleted;
	}

	public double getOutstandingDollarSum() {
		double sum = 0;
		for (OutstandingUser user : outstandingDollar) {
			sum += user.getBalance();
		}

		return sum;
	}

	public double getOutstandingShekelSum() {
		double sum = 0;
		for (OutstandingUser user : outstandingShekel) {
			sum += user.getBalance();
		}

		return sum;
	}

	public double getOutstandingDollarDeletedSum() {
		double sum = 0;
		for (OutstandingUser user : outstandingDollarDeleted) {
			sum += user.getBalance();
		}

		return sum;
	}

	public double getOutstandingShekelDeletedSum() {
		double sum = 0;
		for (OutstandingUser user : outstandingShekelDeleted) {
			sum += user.getBalance();
		}

		return sum;
	}

	// For testing
	public String test() throws UnsupportedEncodingException {

		setGreeting("Searching for: " + search);

		return ActionSupport.SUCCESS;
	}

	public int getSelectedCity() {
		return selectedCity;
	}

	public void setSelectedCity(int selectedCity) {
		this.selectedCity = selectedCity;
		this.setCity(getText(ReportingAction.CITY_PREFIX + selectedCity, ""));
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
	
	public int getSelectedUser() {
		return selectedUser;
	}

	public void setSelectedUser(int selectedUser) {
		this.selectedUser = selectedUser;
	}
	
	public List<Integer> getSelectedItems() {
		return selectedItems;
	}

	public void setSelectedItems(List<Integer> selectedItems) {
		this.selectedItems = selectedItems;
		for (Integer x : this.selectedItems) {
			for (Item i : ListProvider.getItemList(false)) {
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

	// public String test() throws UnsupportedEncodingException {
	//
	// if (search.contains("ali")) {
	// res = "Hi From Ali";
	// } else {
	// res = "not hi";
	// }
	// inputStream = new ByteArrayInputStream(
	// "Hello World! This is a text string response from a Struts 2 Action.".getBytes("UTF-8"));
	// return SUCCESS;
	// }

	public boolean isVatSelect() {
		return vatSelect;
	}

	public void setVatSelect(boolean vatSelect) {
		this.vatSelect = vatSelect;
	}

	public boolean isShowDeletedUsers() {
		return showDeletedUsers;
	}

	public void setShowDeletedUsers(boolean showDeletedUsers) {
		this.showDeletedUsers = showDeletedUsers;
	}
	
	
	// For Testing
	public InputStream getInputStream() {
		return inputStream;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getRes() {
		return res;
	}

	public void setRes(String res) {
		this.res = res;
	}

	public String getGreeting() {
		return greeting;
	}

	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}

	public String getPage() {
		return this.page;
	}

	private List<OutstandingUser> fillUserInfo(UserReportDAO dao, List<OutstandingUser> outstandingUsers) {

		if (outstandingUsers.size() <= 0) {
			return null;
		}

		Map<Integer, OutstandingUser> m = new HashMap<Integer, OutstandingUser>();
		for (OutstandingUser outstandingUser : outstandingUsers) {
			m.put(outstandingUser.getId(), outstandingUser);
		}

		List<Integer> lst = new ArrayList<Integer>();
		lst.addAll(m.keySet());
		List<UserInfo> infos = dao.getUserInfoByIDs(lst);

		for (UserInfo userInfo : infos) {
			m.get(userInfo.getId()).setUserInfo(userInfo);
		}

		return outstandingUsers;
	}
}
