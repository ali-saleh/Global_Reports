package actions.reports;

import interceptors.UserAware;

import java.sql.Date;
import java.util.List;

import actions.ListProvider;
import model.SessionUser;
import db.billingdb.dao.custom.impl.ItemReportDAO;
import db.billingdb.model.custom.ItemReport;
import db.billingdb.model.custom.ItemReportCondition;

public class ItemReportAction extends BaseReportAction implements UserAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5942780533361677212L;

	private ItemReportDAO itemReportDAO;

	private List<ItemReport> itemsReportDollar;
	private List<ItemReport> itemsReportShekel;
	private List<ItemReport> itemsReportDollarDeleted;
	private List<ItemReport> itemsReportShekelDeleted;

	private boolean showDeleted = true;

	public ItemReportAction() {
		itemReportDAO = new ItemReportDAO();
	}

	@Override
	public String execute() throws Exception {

		resetLists();
		ItemReportCondition condition = new ItemReportCondition();

		// City setting
		if (selectedUser != 0) {
			condition.setUserId(selectedUser);
			reportUser = ListProvider.getUserInfo(selectedUser);

			switch (reportUser.getCurrencyId()) {
			case 1:
				this.setCurrencyId(1);
				break;
			case 12:
				this.setCurrencyId(2);

			default:
				break;
			}
		} else if (selectedCity != 0)
			condition.setCity(selectedCity);
		else if (selectedPartner != 0)
			condition.setPartnerId(selectedPartner);
		else if (selectedSalesman != 0)
			condition.setSalesmanId(selectedSalesman);

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

		if (!vatSelect)
			condition.setVatRate(1.0); // Note: this value is just !0 and will
										// be overridden

		if ((this.currencyId & 1) == 1) {
			condition.setCurrencyId(1);
			this.itemsReportDollar = itemReportDAO.getItemReport(condition);
			if (showDeleted) {
				condition.setDeleted(true);
				this.itemsReportDollarDeleted = itemReportDAO
						.getItemReport(condition);
			}
			condition.setDeleted(false);
		}
		if ((this.currencyId & 2) == 2) {
			condition.setCurrencyId(12);
			this.itemsReportShekel = itemReportDAO.getItemReport(condition);
			if (showDeleted) {
				condition.setDeleted(true);
				this.itemsReportShekelDeleted = itemReportDAO
						.getItemReport(condition);
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

	private void resetLists() {
		if (itemsReportDollar != null)
			this.itemsReportDollar.clear();
		if (itemsReportShekel != null)
			this.itemsReportShekel.clear();
		if (itemsReportDollarDeleted != null)
			this.itemsReportDollarDeleted.clear();
		if (itemsReportShekelDeleted != null)
			this.itemsReportShekelDeleted.clear();

	}
}
