package actions.reports;

import interceptors.UserAware;

import java.util.List;

import model.SessionUser;

import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.model.custom.ItemReport;

public class ItemReportAction implements UserAware{
	
	private List<ItemReport> items;

	public List<ItemReport> getItems() {
		return items;
	}

	public void setItems(List<ItemReport> items) {
		this.items = items;
	}
	
	public String execute() throws Exception {
		ItemReportDAO dao = new ItemReportDAO();
		try {
			this.items = dao.report();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}

	@Override
	public void setUser(SessionUser user) {
		// TODO Auto-generated method stub
	}
}
