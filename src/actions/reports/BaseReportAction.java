package actions.reports;

import java.util.ArrayList;
import java.util.List;

import db.billingdb.model.custom.Item;
import db.billingdb.model.custom.info.UserInfo;
import actions.BaseAction;
import actions.ListProvider;
import actions.ReportingAction;

public class BaseReportAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2090323518563785350L;

	public static String PRINT = "print";

	protected String page = "result";

	protected int selectedCity;
	protected String city;
	
	protected int selectedUser;
	protected int selectedPartner;
	protected int selectedSalesman;
	
	protected UserInfo reportUser;
	
	protected int currencyId;
	protected String currency;
	protected List<Integer> selectedItems;
	protected List<String> itemNames = new ArrayList<String>();

	protected String fromDate;
	protected String toDate;
	protected boolean vatSelect;

	protected String isPrint;

	public String getPage() {
		return page;
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

	public int getSelectedUser() {
		return selectedUser;
	}

	public void setSelectedUser(int selectedUser) {
		this.selectedUser = selectedUser;
	}

	public int getSelectedPartner() {
		return selectedPartner;
	}

	public void setSelectedPartner(int selectedPartner) {
		this.selectedPartner = selectedPartner;
	}

	public int getSelectedSalesman() {
		return selectedSalesman;
	}

	public void setSelectedSalesman(int selectedSalesman) {
		this.selectedSalesman = selectedSalesman;
	}

	public UserInfo getReportUser() {
		return reportUser;
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

	public String getIsPrint() {
		return isPrint;
	}

	public void setIsPrint(String isPrint) {
		this.isPrint = isPrint;
	}
}
