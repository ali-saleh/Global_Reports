package actions.reports;

import interceptors.UserAware;

import java.sql.Date;
import java.util.List;

import model.SessionUser;

import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.model.custom.ItemReport;
import db.billingdb.model.custom.ItemReportCondition;

public class ItemReportAction extends BaseReportAction implements UserAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5942780533361677212L;

	private List<ItemReport> itemsReportDollar;
	private List<ItemReport> itemsReportShekel;
	private List<ItemReport> itemsReportDollarDeleted;
	private List<ItemReport> itemsReportShekelDeleted;
	
	private int selectedUser;
	
	private boolean showDeleted = true;
	
	@Override
	public String execute() throws Exception {
		ItemReportDAO dao = new ItemReportDAO();
		ItemReportCondition condition = new ItemReportCondition();

		// City setting
		if (selectedCity != 0)
			condition.setCity(selectedCity);

		// From date validation
		if (fromDate != null && !fromDate.isEmpty())
			condition.setStartDate(Date.valueOf(convertDateFormat(fromDate)));
		// To date validation
		if (toDate != null && !toDate.isEmpty())
			condition.setEndDate(Date.valueOf(convertDateFormat(toDate)));
			
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

		if ((this.currencyId & 1) == 1) {
			condition.setCurrencyId(1);
			this.itemsReportDollar = dao.getItemReport(condition);
			if (showDeleted) {
				condition.setDeleted(true);
				this.itemsReportDollarDeleted = dao.getItemReport(condition);
			}
			condition.setDeleted(false);
		}
		if ((this.currencyId & 2) == 2) {
			condition.setCurrencyId(12);
			this.itemsReportShekel = dao.getItemReport(condition);
			if (showDeleted) {
				condition.setDeleted(true);
				this.itemsReportShekelDeleted = dao.getItemReport(condition);
			}
		}
		
		if (isPrint != null) {
			return PRINT;
		}
		
		return SUCCESS;
	}

	public List<ItemReport> getItemsReportDollar() {
		return itemsReportDollar;
	}

	public List<ItemReport> getItemsReportShekel() {
		return itemsReportShekel;
	}

	public List<ItemReport> getItemsReportDollarDeleted() {
		return itemsReportDollarDeleted;
	}

	public List<ItemReport> getItemsReportShekelDeleted() {
		return itemsReportShekelDeleted;
	}

	public double getItemsReportDollarSum() {
		double sum = 0;
		for (ItemReport item : itemsReportDollar) {
			sum += item.getAmount();
		}

		return sum;
	}

	public double getItemsReportShekelSum() {
		double sum = 0;
		for (ItemReport item : itemsReportShekel) {
			sum += item.getAmount();
		}

		return sum;
	}

	public double getItemsReportDollarDeletedSum() {
		double sum = 0;
		for (ItemReport item : itemsReportDollarDeleted) {
			sum += item.getAmount();
		}

		return sum;
	}

	public double getItemsReportShekelDeletedSum() {
		double sum = 0;
		for (ItemReport item : itemsReportShekelDeleted) {
			sum += item.getAmount();
		}

		return sum;
	}

	public int getSelectedUser() {
		return selectedUser;
	}

	public void setSelectedUser(int selectedUser) {
		this.selectedUser = selectedUser;
	}

	public boolean isShowDeleted() {
		return showDeleted;
	}

	public void setShowDeleted(boolean showDeleted) {
		this.showDeleted = showDeleted;
	}

	@Override
	public void setUser(SessionUser user) {
		// TODO Auto-generated method stub
	}
}
