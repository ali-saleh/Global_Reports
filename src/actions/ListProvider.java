package actions;

import java.util.List;

import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.model.custom.Item;

public class ListProvider {

	private static List<Item> items;

	public static List<Item> getItemList() {
		if (items == null) {
			System.out.println("ListProvider: Creating item list");
			ItemReportDAO dao = new ItemReportDAO();
			items = dao.listItems();
		}

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
}
