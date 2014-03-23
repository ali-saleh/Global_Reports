package actions.reports;

public interface SupportFiltering {
	
	int getCity();
	void setCity(int city);
	
	String getFromDate();
	void setFromDate(String fromDate);
	
	String getToDate();
	void setToDate(String toDate);
	
	boolean getShowDeleted();
	void setShowDeleted(boolean showDeleted);
	
	boolean getWithoutVAT();
	void setWithoutVAT(boolean withoutVat);
	
	int getCommissary();
	void setCommissary(int commissaryNo);
	
	int getPaymentMethod();
	void setPaymentMethod(int paymentMethodID);
}
