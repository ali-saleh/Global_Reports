<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.velocity.runtime.directive.Parse"%>
<%@page import="com.sun.swing.internal.plaf.basic.resources.basic"%>
<%@page import="beans.GCItem"%>
<%@page import="beans.GCItemRPT"%>
<%@page import="beans.GCPayment"%>
<%@page import="bl.JBillingSrvImp"%>
<%@page import="beans.GCInvoice"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="beans.GCConstants"%>
<%@page import="java.util.List"%>
<%@page import="beans.GCUser"%>
<%@page import="utils.GCProperties"%>
<% 
	GCProperties prop = GCProperties.getSystemProperties();
	List<GCItemRPT> itemsReportShekel = (List<GCItemRPT>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS_SHEKEL);
	List<GCItemRPT> itemsReportDollar = (List<GCItemRPT>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS_DOLLAR);
	List<GCItemRPT> itemsReportShekelDeleted = (List<GCItemRPT>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS_SHEKEL_DELETED);
	List<GCItemRPT> itemsReportDollarDeleted = (List<GCItemRPT>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS_DOLLAR_DELETED);
	List<GCItem> items = (List<GCItem>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS);
	
	GCItem tempItem = new GCItem();
	GCItem tempItem2 = new GCItem();
	GCItem tempItem3 = new GCItem();
	GCItem tempItem4 = new GCItem();
	GCItem tempItem5 = new GCItem();
	GCItem tempItem6 = new GCItem();
	GCItem tempItem7 = new GCItem();
	
	tempItem.setId(JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC);
	tempItem.setDescription(prop.get(GCConstants.ITEM_TYPE_CAT_HALF_MB_BASIC));
	items.add(tempItem);
	
	tempItem2.setId(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC);
	tempItem2.setDescription(prop.get(GCConstants.ITEM_TYPE_CAT_1_MB_BASIC));
	items.add(tempItem2);
	
	tempItem3.setId(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC);
	tempItem3.setDescription(prop.get(GCConstants.ITEM_TYPE_CAT_2_MB_BASIC));
	items.add(tempItem3);
	
	tempItem4.setId(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC);
	tempItem4.setDescription(prop.get(GCConstants.ITEM_TYPE_CAT_4_MB_BASIC));
	items.add(tempItem4);
	
	tempItem5.setId(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM);
	tempItem5.setDescription(prop.get(GCConstants.ITEM_TYPE_CAT_1_MB_PREM));
	items.add(tempItem5);
	
	tempItem6.setId(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM);
	tempItem6.setDescription(prop.get(GCConstants.ITEM_TYPE_CAT_2_MB_PREM));
	items.add(tempItem6);
	
	tempItem7.setId(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM);
	tempItem7.setDescription(prop.get(GCConstants.ITEM_TYPE_CAT_4_MB_PREM));
	items.add(tempItem7);
	
	BigDecimal initializer = BigDecimal.ZERO;
	long initializerLong = 0;
	Integer initializerType [] = new Integer[0];
	
	GCItemRPT basicHalfMB = new GCItemRPT();
	basicHalfMB.setAmount(initializer);
	basicHalfMB.setItemQnt(initializer);
	basicHalfMB.setNumOfOrders(initializerLong);
	basicHalfMB.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC);
	basicHalfMB.setTypeIds(initializerType);
	
	
	GCItemRPT basic1MB = new GCItemRPT();
	basic1MB.setAmount(initializer);
	basic1MB.setItemQnt(initializer);
	basic1MB.setNumOfOrders(initializerLong);
	basic1MB.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC);
	basicHalfMB.setTypeIds(initializerType);
	
	GCItemRPT basic2MB = new GCItemRPT();
	basic2MB.setAmount(initializer);
	basic2MB.setItemQnt(initializer);
	basic2MB.setNumOfOrders(initializerLong);
	basic2MB.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC);
	basic2MB.setTypeIds(initializerType);
	
	GCItemRPT basic4MB = new GCItemRPT();
	basic4MB.setAmount(initializer);
	basic4MB.setItemQnt(initializer);
	basic4MB.setNumOfOrders(initializerLong);
	basic4MB.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC);
	basic4MB.setTypeIds(initializerType);
	
	GCItemRPT prem1MB = new GCItemRPT();
	prem1MB.setAmount(initializer);
	prem1MB.setItemQnt(initializer);
	prem1MB.setNumOfOrders(initializerLong);
	prem1MB.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM);
	prem1MB.setTypeIds(initializerType);
	
	GCItemRPT prem2MB = new GCItemRPT();
	prem2MB.setAmount(initializer);
	prem2MB.setItemQnt(initializer);
	prem2MB.setNumOfOrders(initializerLong);
	prem2MB.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM);
	prem2MB.setTypeIds(initializerType);
	
	GCItemRPT prem4MB = new GCItemRPT();
	prem4MB.setAmount(initializer);
	prem4MB.setItemQnt(initializer);
	prem4MB.setNumOfOrders(initializerLong);
	prem4MB.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM);
	prem4MB.setTypeIds(initializerType);
	
	if(itemsReportShekel!=null){
		for(GCItemRPT item:itemsReportShekel){
			if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC)){
				basicHalfMB.setAmount(item.getAmount().add(basicHalfMB.getAmount()));
				basicHalfMB.setCurrencyId(item.getCurrencyId());
				basicHalfMB.setItemQnt(item.getItemQnt().add(basicHalfMB.getItemQnt()));
				basicHalfMB.setNumOfOrders(item.getNumOfOrders()+basicHalfMB.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC)){
				basic1MB.setAmount(item.getAmount().add(basic1MB.getAmount()));
				basic1MB.setCurrencyId(item.getCurrencyId());
				basic1MB.setItemQnt(item.getItemQnt().add(basic1MB.getItemQnt()));
				basic1MB.setNumOfOrders(item.getNumOfOrders()+basic1MB.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC)){
				basic2MB.setAmount(item.getAmount().add(basic2MB.getAmount()));
				basic2MB.setCurrencyId(item.getCurrencyId());
				basic2MB.setItemDescription(prop.get(GCConstants.ITEM_TYPE_CAT_2_MB_BASIC, null));
				basic2MB.setItemQnt(item.getItemQnt().add(basic2MB.getItemQnt()));
				basic2MB.setNumOfOrders(item.getNumOfOrders()+basic2MB.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC)){
				basic4MB.setAmount(item.getAmount().add(basic4MB.getAmount()));
				basic4MB.setCurrencyId(item.getCurrencyId());
				basic4MB.setItemQnt(item.getItemQnt().add(basic4MB.getItemQnt()));
				basic4MB.setNumOfOrders(item.getNumOfOrders()+basic4MB.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM)){
				prem1MB.setAmount(item.getAmount().add(prem1MB.getAmount()));
				prem1MB.setCurrencyId(item.getCurrencyId());
				prem1MB.setItemQnt(item.getItemQnt().add(prem1MB.getItemQnt()));
				prem1MB.setNumOfOrders(item.getNumOfOrders()+prem1MB.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM)){
				prem2MB.setAmount(item.getAmount().add(prem2MB.getAmount()));
				prem2MB.setCurrencyId(item.getCurrencyId());
				prem2MB.setItemQnt(item.getItemQnt().add(prem2MB.getItemQnt()));
				prem2MB.setNumOfOrders(item.getNumOfOrders()+prem2MB.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM)){
				prem4MB.setAmount(item.getAmount().add(prem4MB.getAmount()));
				prem4MB.setCurrencyId(item.getCurrencyId());
				prem4MB.setItemQnt(item.getItemQnt().add(prem4MB.getItemQnt()));
				prem4MB.setNumOfOrders(item.getNumOfOrders()+prem4MB.getNumOfOrders());
			}
		}
		itemsReportShekel.add(basicHalfMB);
		itemsReportShekel.add(basic1MB);
		itemsReportShekel.add(basic2MB);
		itemsReportShekel.add(basic4MB);
		itemsReportShekel.add(prem1MB);
		itemsReportShekel.add(prem2MB);
		itemsReportShekel.add(prem4MB);	
	}
	
	
	GCItemRPT basicHalfMB2 = new GCItemRPT();
	basicHalfMB2.setAmount(initializer);
	basicHalfMB2.setItemQnt(initializer);
	basicHalfMB2.setNumOfOrders(initializerLong);
	basicHalfMB2.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC);
	basicHalfMB2.setTypeIds(initializerType);
	
	
	GCItemRPT basic1MB2 = new GCItemRPT();
	basic1MB2.setAmount(initializer);
	basic1MB2.setItemQnt(initializer);
	basic1MB2.setNumOfOrders(initializerLong);
	basic1MB2.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC);
	basic1MB2.setTypeIds(initializerType);
	
	GCItemRPT basic2MB2 = new GCItemRPT();
	basic2MB2.setAmount(initializer);
	basic2MB2.setItemQnt(initializer);
	basic2MB2.setNumOfOrders(initializerLong);
	basic2MB2.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC);
	basic2MB2.setTypeIds(initializerType);
	
	GCItemRPT basic4MB2 = new GCItemRPT();
	basic4MB2.setAmount(initializer);
	basic4MB2.setItemQnt(initializer);
	basic4MB2.setNumOfOrders(initializerLong);
	basic4MB2.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC);
	basic4MB2.setTypeIds(initializerType);
	
	GCItemRPT prem1MB2 = new GCItemRPT();
	prem1MB2.setAmount(initializer);
	prem1MB2.setItemQnt(initializer);
	prem1MB2.setNumOfOrders(initializerLong);
	prem1MB2.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM);
	prem1MB2.setTypeIds(initializerType);
	
	GCItemRPT prem2MB2 = new GCItemRPT();
	prem2MB2.setAmount(initializer);
	prem2MB2.setItemQnt(initializer);
	prem2MB2.setNumOfOrders(initializerLong);
	prem2MB2.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM);
	prem2MB2.setTypeIds(initializerType);
	
	GCItemRPT prem4MB2 = new GCItemRPT();
	prem4MB2.setAmount(initializer);
	prem4MB2.setItemQnt(initializer);
	prem4MB2.setNumOfOrders(initializerLong);
	prem4MB2.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM);
	prem4MB2.setTypeIds(initializerType);
	
	if(itemsReportDollar !=null){
		for(GCItemRPT item:itemsReportDollar){
			if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC)){
				basicHalfMB2.setAmount(item.getAmount().add(basicHalfMB2.getAmount()));
				basicHalfMB2.setCurrencyId(item.getCurrencyId());
				basicHalfMB2.setItemQnt(item.getItemQnt().add(basicHalfMB2.getItemQnt()));
				basicHalfMB2.setNumOfOrders(item.getNumOfOrders()+basicHalfMB2.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC)){
				basic1MB2.setAmount(item.getAmount().add(basic1MB2.getAmount()));
				basic1MB2.setCurrencyId(item.getCurrencyId());
				basic1MB2.setItemQnt(item.getItemQnt().add(basic1MB2.getItemQnt()));
				basic1MB2.setNumOfOrders(item.getNumOfOrders()+basic1MB2.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC)){
				basic2MB2.setAmount(item.getAmount().add(basic2MB2.getAmount()));
				basic2MB2.setCurrencyId(item.getCurrencyId());
				basic2MB2.setItemDescription(prop.get(GCConstants.ITEM_TYPE_CAT_2_MB_BASIC, null));
				basic2MB2.setItemQnt(item.getItemQnt().add(basic2MB2.getItemQnt()));
				basic2MB2.setNumOfOrders(item.getNumOfOrders()+basic2MB2.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC)){
				basic4MB2.setAmount(item.getAmount().add(basic4MB2.getAmount()));
				basic4MB2.setCurrencyId(item.getCurrencyId());
				basic4MB2.setItemQnt(item.getItemQnt().add(basic4MB2.getItemQnt()));
				basic4MB2.setNumOfOrders(item.getNumOfOrders()+basic4MB2.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM)){
				prem1MB2.setAmount(item.getAmount().add(prem1MB2.getAmount()));
				prem1MB2.setCurrencyId(item.getCurrencyId());
				prem1MB2.setItemQnt(item.getItemQnt().add(prem1MB2.getItemQnt()));
				prem1MB2.setNumOfOrders(item.getNumOfOrders()+prem1MB2.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM)){
				prem2MB2.setAmount(item.getAmount().add(prem2MB2.getAmount()));
				prem2MB2.setCurrencyId(item.getCurrencyId());
				prem2MB2.setItemQnt(item.getItemQnt().add(prem2MB2.getItemQnt()));
				prem2MB2.setNumOfOrders(item.getNumOfOrders()+prem2MB2.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM)){
				prem4MB2.setAmount(item.getAmount().add(prem4MB2.getAmount()));
				prem4MB2.setCurrencyId(item.getCurrencyId());
				prem4MB2.setItemQnt(item.getItemQnt().add(prem4MB2.getItemQnt()));
				prem4MB2.setNumOfOrders(item.getNumOfOrders()+prem4MB2.getNumOfOrders());
			}
		}
		itemsReportDollar.add(basicHalfMB2);
		itemsReportDollar.add(basic1MB2);
		itemsReportDollar.add(basic2MB2);
		itemsReportDollar.add(basic4MB2);
		itemsReportDollar.add(prem1MB2);
		itemsReportDollar.add(prem2MB2);
		itemsReportDollar.add(prem4MB2);	
	}
	
	GCItemRPT basicHalfMB3 = new GCItemRPT();
	basicHalfMB3.setAmount(initializer);
	basicHalfMB3.setItemQnt(initializer);
	basicHalfMB3.setNumOfOrders(initializerLong);
	basicHalfMB3.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC);
	basicHalfMB3.setTypeIds(initializerType);
	
	
	GCItemRPT basic1MB3 = new GCItemRPT();
	basic1MB3.setAmount(initializer);
	basic1MB3.setItemQnt(initializer);
	basic1MB3.setNumOfOrders(initializerLong);
	basic1MB3.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC);
	basic1MB3.setTypeIds(initializerType);
	
	GCItemRPT basic2MB3 = new GCItemRPT();
	basic2MB3.setAmount(initializer);
	basic2MB3.setItemQnt(initializer);
	basic2MB3.setNumOfOrders(initializerLong);
	basic2MB3.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC);
	basic2MB3.setTypeIds(initializerType);
	
	GCItemRPT basic4MB3 = new GCItemRPT();
	basic4MB3.setAmount(initializer);
	basic4MB3.setItemQnt(initializer);
	basic4MB3.setNumOfOrders(initializerLong);
	basic4MB3.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC);
	basic4MB3.setTypeIds(initializerType);
	
	GCItemRPT prem1MB3 = new GCItemRPT();
	prem1MB3.setAmount(initializer);
	prem1MB3.setItemQnt(initializer);
	prem1MB3.setNumOfOrders(initializerLong);
	prem1MB3.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM);
	prem1MB3.setTypeIds(initializerType);
	
	GCItemRPT prem2MB3 = new GCItemRPT();
	prem2MB3.setAmount(initializer);
	prem2MB3.setItemQnt(initializer);
	prem2MB3.setNumOfOrders(initializerLong);
	prem2MB3.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM);
	prem2MB3.setTypeIds(initializerType);
	
	GCItemRPT prem4MB3 = new GCItemRPT();
	prem4MB3.setAmount(initializer);
	prem4MB3.setItemQnt(initializer);
	prem4MB3.setNumOfOrders(initializerLong);
	prem4MB3.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM);
	prem4MB3.setTypeIds(initializerType);
	
	if(itemsReportShekelDeleted != null){
		for(GCItemRPT item:itemsReportShekelDeleted){
			if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC)){
				basicHalfMB3.setAmount(item.getAmount().add(basicHalfMB3.getAmount()));
				basicHalfMB3.setCurrencyId(item.getCurrencyId());
				basicHalfMB3.setItemQnt(item.getItemQnt().add(basicHalfMB3.getItemQnt()));
				basicHalfMB3.setNumOfOrders(item.getNumOfOrders()+basicHalfMB3.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC)){
				basic1MB3.setAmount(item.getAmount().add(basic1MB3.getAmount()));
				basic1MB3.setCurrencyId(item.getCurrencyId());
				basic1MB3.setItemQnt(item.getItemQnt().add(basic1MB3.getItemQnt()));
				basic1MB3.setNumOfOrders(item.getNumOfOrders()+basic1MB3.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC)){
				basic2MB3.setAmount(item.getAmount().add(basic2MB3.getAmount()));
				basic2MB3.setCurrencyId(item.getCurrencyId());
				basic2MB3.setItemDescription(prop.get(GCConstants.ITEM_TYPE_CAT_2_MB_BASIC, null));
				basic2MB3.setItemQnt(item.getItemQnt().add(basic2MB3.getItemQnt()));
				basic2MB3.setNumOfOrders(item.getNumOfOrders()+basic2MB3.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC)){
				basic4MB3.setAmount(item.getAmount().add(basic4MB3.getAmount()));
				basic4MB3.setCurrencyId(item.getCurrencyId());
				basic4MB3.setItemQnt(item.getItemQnt().add(basic4MB3.getItemQnt()));
				basic4MB3.setNumOfOrders(item.getNumOfOrders()+basic4MB3.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM)){
				prem1MB3.setAmount(item.getAmount().add(prem1MB3.getAmount()));
				prem1MB3.setCurrencyId(item.getCurrencyId());
				prem1MB3.setItemQnt(item.getItemQnt().add(prem1MB3.getItemQnt()));
				prem1MB3.setNumOfOrders(item.getNumOfOrders()+prem1MB3.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM)){
				prem2MB3.setAmount(item.getAmount().add(prem2MB3.getAmount()));
				prem2MB3.setCurrencyId(item.getCurrencyId());
				prem2MB3.setItemQnt(item.getItemQnt().add(prem2MB3.getItemQnt()));
				prem2MB3.setNumOfOrders(item.getNumOfOrders()+prem2MB3.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM)){
				prem4MB3.setAmount(item.getAmount().add(prem4MB3.getAmount()));
				prem4MB3.setCurrencyId(item.getCurrencyId());
				prem4MB3.setItemQnt(item.getItemQnt().add(prem4MB3.getItemQnt()));
				prem4MB3.setNumOfOrders(item.getNumOfOrders()+prem4MB3.getNumOfOrders());
			}
		}
		itemsReportShekelDeleted.add(basicHalfMB3);
		itemsReportShekelDeleted.add(basic1MB3);
		itemsReportShekelDeleted.add(basic2MB3);
		itemsReportShekelDeleted.add(basic4MB3);
		itemsReportShekelDeleted.add(prem1MB3);
		itemsReportShekelDeleted.add(prem2MB3);
		itemsReportShekelDeleted.add(prem4MB3);
	}

	
	GCItemRPT basicHalfMB4 = new GCItemRPT();
	basicHalfMB4.setAmount(initializer);
	basicHalfMB4.setItemQnt(initializer);
	basicHalfMB4.setNumOfOrders(initializerLong);
	basicHalfMB4.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC);
	basicHalfMB4.setTypeIds(initializerType);
	
	
	GCItemRPT basic1MB4 = new GCItemRPT();
	basic1MB4.setAmount(initializer);
	basic1MB4.setItemQnt(initializer);
	basic1MB4.setNumOfOrders(initializerLong);
	basic1MB4.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC);
	basic1MB4.setTypeIds(initializerType);
	
	GCItemRPT basic2MB4 = new GCItemRPT();
	basic2MB4.setAmount(initializer);
	basic2MB4.setItemQnt(initializer);
	basic2MB4.setNumOfOrders(initializerLong);
	basic2MB4.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC);
	basic2MB4.setTypeIds(initializerType);
	
	GCItemRPT basic4MB4 = new GCItemRPT();
	basic4MB4.setAmount(initializer);
	basic4MB4.setItemQnt(initializer);
	basic4MB4.setNumOfOrders(initializerLong);
	basic4MB4.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC);
	basic4MB4.setTypeIds(initializerType);
	
	GCItemRPT prem1MB4 = new GCItemRPT();
	prem1MB4.setAmount(initializer);
	prem1MB4.setItemQnt(initializer);
	prem1MB4.setNumOfOrders(initializerLong);
	prem1MB4.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM);
	prem1MB4.setTypeIds(initializerType);
	
	GCItemRPT prem2MB4 = new GCItemRPT();
	prem2MB4.setAmount(initializer);
	prem2MB4.setItemQnt(initializer);
	prem2MB4.setNumOfOrders(initializerLong);
	prem2MB4.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM);
	prem2MB4.setTypeIds(initializerType);
	
	GCItemRPT prem4MB4 = new GCItemRPT();
	prem4MB4.setAmount(initializer);
	prem4MB4.setItemQnt(initializer);
	prem4MB4.setNumOfOrders(initializerLong);
	prem4MB4.setItemID(JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM);
	prem4MB4.setTypeIds(initializerType);
	
	if(itemsReportDollarDeleted != null){
		for(GCItemRPT item:itemsReportDollarDeleted){
			if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC)){
				basicHalfMB4.setAmount(item.getAmount().add(basicHalfMB4.getAmount()));
				basicHalfMB4.setCurrencyId(item.getCurrencyId());
				basicHalfMB4.setItemQnt(item.getItemQnt().add(basicHalfMB4.getItemQnt()));
				basicHalfMB4.setNumOfOrders(item.getNumOfOrders()+basicHalfMB4.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC)){
				basic1MB4.setAmount(item.getAmount().add(basic1MB4.getAmount()));
				basic1MB4.setCurrencyId(item.getCurrencyId());
				basic1MB4.setItemQnt(item.getItemQnt().add(basic1MB4.getItemQnt()));
				basic1MB4.setNumOfOrders(item.getNumOfOrders()+basic1MB4.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC)){
				basic2MB4.setAmount(item.getAmount().add(basic2MB4.getAmount()));
				basic2MB4.setCurrencyId(item.getCurrencyId());
				basic2MB4.setItemDescription(prop.get(GCConstants.ITEM_TYPE_CAT_2_MB_BASIC, null));
				basic2MB4.setItemQnt(item.getItemQnt().add(basic2MB4.getItemQnt()));
				basic2MB4.setNumOfOrders(item.getNumOfOrders()+basic2MB4.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC)){
				basic4MB4.setAmount(item.getAmount().add(basic4MB4.getAmount()));
				basic4MB4.setCurrencyId(item.getCurrencyId());
				basic4MB4.setItemQnt(item.getItemQnt().add(basic4MB4.getItemQnt()));
				basic4MB4.setNumOfOrders(item.getNumOfOrders()+basic4MB4.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM)){
				prem1MB4.setAmount(item.getAmount().add(basic4MB4.getAmount()));
				basic4MB4.setCurrencyId(item.getCurrencyId());
				basic4MB4.setItemQnt(item.getItemQnt().add(basic4MB4.getItemQnt()));
				basic4MB4.setNumOfOrders(item.getNumOfOrders()+basic4MB4.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM)){
				prem2MB4.setAmount(item.getAmount().add(prem2MB4.getAmount()));
				prem2MB4.setCurrencyId(item.getCurrencyId());
				prem2MB4.setItemQnt(item.getItemQnt().add(prem2MB4.getItemQnt()));
				prem2MB4.setNumOfOrders(item.getNumOfOrders()+prem2MB4.getNumOfOrders());
			}else if(JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM)){
				prem4MB4.setAmount(item.getAmount().add(prem4MB4.getAmount()));
				prem4MB4.setCurrencyId(item.getCurrencyId());
				prem4MB4.setItemQnt(item.getItemQnt().add(prem4MB4.getItemQnt()));
				prem4MB4.setNumOfOrders((item.getNumOfOrders()+prem4MB4.getNumOfOrders()));
			}
		}
		itemsReportDollarDeleted.add(basicHalfMB4);
		itemsReportDollarDeleted.add(basic1MB4);
		itemsReportDollarDeleted.add(basic2MB4);
		itemsReportDollarDeleted.add(basic4MB4);
		itemsReportDollarDeleted.add(prem1MB4);
		itemsReportDollarDeleted.add(prem2MB4);
		itemsReportDollarDeleted.add(prem4MB4);	
	}
	
	
	String cityIDString = (String)request.getAttribute(GCConstants.FLD_USR_CITY);
	String fromDateString = (String)request.getAttribute(GCConstants.FLD_REPORTS_DATE_FROM);
	String toDateString = (String)request.getAttribute(GCConstants.FLD_REPORTS_DATE_TO);
	BigDecimal customerBalance = BigDecimal.ZERO;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<link rel="stylesheet" type="text/css" href="./client/css/reports.css" />
		<title>
		
		</title>
	</head>
	<body>
		<div class="report_results_page balance_results_report">
		<div class="report_main_title">
			<%= prop.get(GCConstants.MSG_REPORTS_ACCOUNTING_REPORT_TITLE, null) %>
		</div>
		<div class="report_logo">
			<img alt="logo" src="./client/images/logobw.png">
		</div>
		<div style="clear:both;"></div>
		<div class="seperator"></div>
		<div class="seperator"></div>
		<div class="report_info">
			<div class="report_city">
				<% if(cityIDString.equals("0")){ %>
					<%= prop.get(GCConstants.MSG_REPORTS_ALL_CITIES, null) %>
				<%}else{ %>
					<%= prop.get(GCConstants.MSG_REPORTS_ONE_CITY, null)+" "+prop.get(GCConstants.PROP_CITY_PREFIX+cityIDString, null) %>
				<%} %>
			</div>
			<div class="report_date">
				<div class="report_from_date">
					<%= prop.get(GCConstants.MSG_REPORTS_FROM_DATE, null)+" "+fromDateString %>
				</div>
				<div class="report_to_date">
					<%= prop.get(GCConstants.MSG_REPORTS_TO_DATE, null)+" "+toDateString %>
				</div>
			</div>
			<div class="report_payway">
				
			</div>
		</div>
		<div class="seperator"></div>
		<div class="seperator"></div>
		<% if(itemsReportShekel!=null){ %>
		<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_ACCOU_SHEKEL, null) %>
			</div>
			<div style="clear: both;"></div>
			<table>
				<tr>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_ID, null) %></th>
					<th style="width: 250px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_DESCRIPTION, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_QUANTITY, null) %></th>
					<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_COST, null)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12") %></th>
				</tr>
				<% for(GCItemRPT item:itemsReportShekel){ %>
					<% if(!JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM) &&
						  !item.getItemQnt().equals(BigDecimal.ZERO)) {%>
						<tr>
							<td style="text-align: center;"><%= item.getItemID() %></td>
							<td>
							<% for(GCItem findItem:items){ %>
								<% if(item.getItemID().compareTo(findItem.getId())==0){ %>
									<%= findItem.getDescription() %>
								<%} %>
							<%} %>
							</td>
							<td style="text-align: center;"><%= item.getItemQnt() %></td>
							<td><%= item.getAmount() %></td>
						</tr>
						<% customerBalance=customerBalance.add(item.getAmount()); %>
					<%} %>
				<%} %>
				<tr>
				<td style="border: 0;" colspan="1"></td>
				<td style="font-weight: bold; border: 0;" colspan="2"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM_2)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></td>
				<td style="font-weight: bold;"><%=customerBalance.toString()+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX+"12") %></td>
				</tr>
			</table>
		<%} %>
		
		<% if(itemsReportDollar!=null){ %>
		<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_ACCOU_DOLLAR, null) %>
			</div>
			<div style="clear: both;"></div>
			<table>
				<tr>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_ID, null) %></th>
					<th style="width: 250px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_DESCRIPTION, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_QUANTITY, null) %></th>
					<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_COST, null)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1") %></th>
				</tr>
				<% for(GCItemRPT item:itemsReportDollar){ %>
					<% if(!JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM) &&
						  !item.getItemQnt().equals(BigDecimal.ZERO)) {%>
						<tr>
							<td style="text-align: center;"><%= item.getItemID() %></td>
							<td>
							<% for(GCItem findItem:items){ %>
								<% if(item.getItemID().compareTo(findItem.getId())==0){ %>
									<%= findItem.getDescription() %>
								<%} %>
							<%} %>
							</td>
							<td style="text-align: center;"><%= item.getItemQnt() %></td>
							<td><%= item.getAmount() %></td>
						</tr>
						<% customerBalance=customerBalance.add(item.getAmount()); %>
					<%} %>
				<%} %>
				<tr>
				<td style="border: 0;" colspan="1"></td>
				<td style="font-weight: bold; border: 0;" colspan="2"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM_2)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></td>
				<td style="font-weight: bold;"><%=customerBalance.toString()+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX+"1") %></td>
				</tr>
			</table>
		<%} %>
		
		<% if(itemsReportShekelDeleted!=null){ %>
		<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_ACCOU_SHEKEL_DELETED, null) %>
			</div>
			<div style="clear: both;"></div>
			<table>
				<tr>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_ID, null) %></th>
					<th style="width: 250px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_DESCRIPTION, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_QUANTITY, null) %></th>
					<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_COST, null)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12") %></th>
				</tr>
				<% for(GCItemRPT item:itemsReportShekelDeleted){ %>
				<% if(!JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM) &&
						  !item.getItemQnt().equals(BigDecimal.ZERO)) {%>
						<tr>
							<td style="text-align: center;"><%= item.getItemID() %></td>
							<td>
							<% for(GCItem findItem:items){ %>
								<% if(item.getItemID().compareTo(findItem.getId())==0){ %>
									<%= findItem.getDescription() %>
								<%} %>
							<%} %>
							</td>
							<td style="text-align: center;"><%= item.getItemQnt() %></td>
							<td><%= item.getAmount() %></td>
						</tr>
						<% customerBalance=customerBalance.add(item.getAmount()); %>
					<%} %>
				<%} %>
				<tr>
				<td style="border: 0;" colspan="1"></td>
				<td style="font-weight: bold; border: 0;" colspan="2"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM_2)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></td>
				<td style="font-weight: bold;"><%=customerBalance.toString()+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX+"12") %></td>
				</tr>
			</table>
		<%} %>
		
		<% if(itemsReportDollarDeleted!=null){ %>
		<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_ACCOU_DOLLAR_DELETED, null) %>
			</div>
			<div style="clear: both;"></div>
			<table>
				<tr>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_ID, null) %></th>
					<th style="width: 250px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_DESCRIPTION, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_QUANTITY, null) %></th>
					<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_ACCOU_ITEM_COST, null)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1") %></th>
				</tr>
				<% for(GCItemRPT item:itemsReportDollarDeleted){ %>
					<% if(!JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_HALF_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_BASIC) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_1_MB_PREM) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_2_MB_PREM) &&
						  !JBillingSrvImp.isItemFromCertainType(item.getTypeIds(), JBillingSrvImp.ITEM_TYPE_CAT_4_MB_PREM) &&
						  !item.getItemQnt().equals(BigDecimal.ZERO)) {%>
						<tr>
							<td style="text-align: center;"><%= item.getItemID() %></td>
							<td>
							<% for(GCItem findItem:items){ %>
								<% if(item.getItemID().compareTo(findItem.getId())==0){ %>
									<%= findItem.getDescription() %>
								<%} %>
							<%} %>
							</td>
							<td style="text-align: center;"><%= item.getItemQnt() %></td>
							<td><%= item.getAmount() %></td>
						</tr>
						<% customerBalance=customerBalance.add(item.getAmount()); %>
					<%} %>
				<%} %>
				<tr>
				<td style="border: 0;" colspan="1"></td>
				<td style="font-weight: bold; border: 0;" colspan="2"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM_2)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></td>
				<td style="font-weight: bold;"><%=customerBalance.toString()+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX+"1") %></td>
				</tr>
			</table>
		<%} %>
		</div>
	</body>
</html>