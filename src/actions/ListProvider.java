package actions;

import java.util.List;

import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.dao.custom.impl.UserReportDAO;
import db.billingdb.model.custom.Customer;
import db.billingdb.model.custom.Item;

public class ListProvider {

	private static List<Item> items;
	private static List<Customer> customrs;

	public static List<Item> getItemList() {
//		if (items == null) {
			System.out.println("ListProvider: Creating item list");
			ItemReportDAO dao = new ItemReportDAO();
			items = dao.listItems();
			
//			items = new ArrayList<Item>();
//			int i = 0;
//			while (i < 10) {
//				Item x = new Item();
//				x.setId(i);
//				x.setDesc("Test Item" + i);
//			}
//		}

		return items;
	}

	public static List<Item> getPartnerList() {
		// TODO: complete this code
		return null;
	}

	public static List<Item> getSalesManList() {
		// TODO: complete this code
		return null;
	}
	
	public static List<Customer> getCustomerList() {
//		if (customrs == null) {
			System.out.println("ListProvider: Creating customer list");
			UserReportDAO dao = new UserReportDAO();
			customrs = dao.getAllCustomers();
//		}
		
		return customrs;
	}
}
