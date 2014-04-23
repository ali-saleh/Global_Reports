package actions.reports;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.dao.custom.impl.UserReportDAO;
import db.billingdb.model.custom.ItemReport;
import db.billingdb.model.custom.ItemReportCondition;
import db.billingdb.model.custom.OutstandingUser;
import db.billingdb.model.custom.OutstandingUserCondition;
import db.billingdb.model.custom.info.UserInfo;

public class UserReportAction extends BaseReportAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9010796324682946356L;

	private UserReportDAO userReportDAO;
	private ItemReportDAO itemReportDAO;

	private List<OutstandingUser> outstandingDollar;
	private List<OutstandingUser> outstandingShekel;
	private List<OutstandingUser> outstandingDollarDeleted;
	private List<OutstandingUser> outstandingShekelDeleted;
	
	private List<ItemReport> serviceReport;
	
	private UserInfo reportUser;
	
	private boolean showDeletedUsers;

	// For Testing
	private InputStream inputStream;
	private String search;
	private String res;

	private String greeting;
	
	public UserReportAction() {
		userReportDAO = new UserReportDAO();
		itemReportDAO = new ItemReportDAO();
	}
	
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String outstandingReport() {

		OutstandingUserCondition condition = new OutstandingUserCondition();

		if (selectedCity != 0) {
			condition.setCity(selectedCity);
		}

		// Currency setting
		if ((this.currencyId & 1) == 1) {
			condition.setCurrencyId(1);
			this.outstandingDollar = fillUserInfo(userReportDAO, userReportDAO.getOutstandingUsers(condition));
			if (showDeletedUsers) {
				condition.setDeleted(true);
				this.outstandingDollarDeleted = fillUserInfo(userReportDAO, userReportDAO.getOutstandingUsers(condition));
			}
		}
		
		condition.setDeleted(false);
		
		if ((this.currencyId & 2) == 2) {
			condition.setCurrencyId(12);
			this.outstandingShekel = fillUserInfo(userReportDAO, userReportDAO.getOutstandingUsers(condition));
			if (showDeletedUsers) {
				condition.setDeleted(true);
				this.outstandingShekelDeleted = fillUserInfo(userReportDAO, userReportDAO.getOutstandingUsers(condition));
			}
		}
		
		if(isPrint != null) {
			return PRINT;
		}
		
		return SUCCESS;
	}

	public String userServiceReport() {
		ItemReportCondition condition = new ItemReportCondition();
		
		// Specific User
		if (selectedUser != 0 ) {
			condition.setUserId(selectedUser);
			reportUser = userReportDAO.getUserInfoByID(selectedUser);
		} else {
			//TODO: some error must be added.
			return ERROR;
		}
		
		// Item selection
		if (selectedItems != null && selectedItems.size() > 0) {
			condition.setItemIds(selectedItems);
		}
		
		if (!vatSelect)
			condition.setVatRate(1.0); // Note: this value is just !0 and will
										// be overridden
		serviceReport = itemReportDAO.getItemReport(condition);
		
		if(isPrint != null) {
			return PRINT;
		}
		
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

	public List<ItemReport> getServiceReport() {
		return this.serviceReport;
	}
	
	public UserInfo getReportUser() {
		return this.reportUser;
	}
	
	// For testing
	public String test() throws UnsupportedEncodingException {

		setGreeting("Searching for: " + search);

		return ActionSupport.SUCCESS;
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
