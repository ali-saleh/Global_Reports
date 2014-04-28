package actions;

import java.util.List;

import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.dao.custom.impl.UserReportDAO;
import db.billingdb.model.custom.Customer;
import db.billingdb.model.custom.Item;
import db.billingdb.model.custom.SimpleUser;
import db.billingdb.model.custom.info.UserInfo;

public class ListProvider {

	private static List<Item> items;
	private static List<SimpleUser> salesmen;
	private static List<SimpleUser> partners;
	private static List<Customer> customrs;

	private static ItemReportDAO itemReportDAO;
	private static UserReportDAO userReportDAO;

	static {
		itemReportDAO = new ItemReportDAO();
		userReportDAO = new UserReportDAO();
	}

	public static List<Item> getItemList(boolean reload) {
		if (items == null || reload) {
			System.out.println("ListProvider: Creating item list");
			items = itemReportDAO.listItems();
		}
		return items;
	}

	public static List<SimpleUser> getPartnerList(int city, boolean reload) {
		if (partners == null || reload) {
			System.out.println("ListProvider: Creating Partners list");
			if (city != 0)
				partners = userReportDAO.getPartnersByCity(city);
			else
				partners = userReportDAO.getAllPartners();
		}
		return partners;
	}

	public static List<SimpleUser> getSalesmanList(int city, boolean reload) {
		if (salesmen == null || reload) {
			System.out.println("ListProvider: Creating Salesmen list");
			if (city != 0)
				salesmen = userReportDAO.getSalesmenByCity(city);
			else
				salesmen = userReportDAO.getAllSalesmen();
		}

		return salesmen;
	}

	/**
	 * @param city
	 * @param reload
	 * @return
	 */
	public static List<Customer> getCustomerList(int city, boolean reload) {
		if (customrs == null) {
			System.out.println("ListProvider: Creating customer list");
			if (city != 0)
				customrs = userReportDAO.getCustomersByCity(city);
			else
				customrs = userReportDAO.getAllCustomers();
		}

		return customrs;
	}

	/**
	 * Though it is not a list but this is the optimal place possibly will
	 * change class name to something else
	 * 
	 * @param userId
	 * @return
	 */
	public static UserInfo getUserInfo(int userId) {
		return userReportDAO.getUserInfoByID(userId);
	}

	/**
	 * Simple getter to get selected partner
	 * Note: the function is passive and only checks created lists
	 * @param partnerId
	 * @return
	 */
	public static SimpleUser getPartnerInfoById(int partnerId) {
		if (partners == null) {
			return null;
		}

		for (SimpleUser user : partners) {
			if (user.getId() == partnerId)
				return user;
		}
		
		return null;
	}
	
	/**
	 * Simple getter to get selected salesman
	 * Note: the function is passive and only checks created lists
	 * @param salesmanId
	 * @return
	 */
	public static SimpleUser getSalesmanInfoById(int salesmanId) {
		if (salesmen == null) {
			return null;
		}

		for (SimpleUser user : salesmen) {
			if (user.getId() == salesmanId)
				return user;
		}
		
		return null;
	}
}
