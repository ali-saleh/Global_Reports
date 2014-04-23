package actions;

import java.util.List;

import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.dao.custom.impl.UserReportDAO;
import db.billingdb.model.custom.Customer;
import db.billingdb.model.custom.Item;
import db.billingdb.model.custom.SimpleUser;

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
}
