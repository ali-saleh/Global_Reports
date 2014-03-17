$(document)
		.ready(
				function() {
					var doneJSON = false;
					var paymentDoneJSON = false;
					var items = new Array();
					var existingItems = new Array();
					var invoicesCounter = 0;
					var invoices = new Array();
					var existingInvoices = new Array();

					$(".password_generator").click(
							function() {
								$.getJSON("./user?action=randpass&callback=?",
										function(data) {
											if (data['password'] == null) {
												alert('Internal Server Error');
											} else {
												$('#fld_14').val(
														data['password']);
												$('#fld_15').val(
														data['password']);
											}
										});
							});

					$('#closeitemstable').live("click", function() {
						$('#lightbox').css({
							display : 'none'
						});
						$('.otheritemstable').css({
							display : 'none'
						});
					});

					$("#add_item")
							.click(
									function() {
										var currencyId = $('#currency_Id')
												.text();
										if (!doneJSON) {
											$(this).hide();
											$
													.getJSON(
															"./order?action=items&currencyId="
																	+ currencyId
																	+ "&callback=?",
															function(data) {
																if (data != null) {
																	showLighbox();
																	$
																			.each(
																					data,
																					function(
																							index,
																							value) {
																						var item = new Array(
																								index,
																								value['Description'],
																								value['Price'],
																								value['CurrencyId'],
																								value['is_editable'],
																								value['Percentage'],
																								value['isQuntitable'],
																								value['isSuper'],
																								value['item_period']);
																						items
																								.push(item);
																					});
																	doneJSON = true;
																	initializeItems(
																			items,
																			existingItems);
																	generateTable(
																			items,
																			'new');
																} else {
																	alert('Internal Server Error');
																}
																$("#add_item")
																		.show();
															});
										} else {
											showLighbox();
											generateTable(items, 'new');
										}
									});

					$('.itemrow').live('mouseover', function() {
						$(this).css({
							backgroundColor : '#E7EBF0'
						});
					});
					$('.itemrow').live('mouseout', function() {
						$(this).css({
							backgroundColor : 'white'
						});
					});
					$('.itemrow').live('click', function() {
						var id = $(this).attr('id');
						addItem(id, items, existingItems);
						$('#lightbox').css({
							display : 'none'
						});
						$('.otheritemstable').css({
							display : 'none'
						});
					});
					$('.removeItem').live('click', function() {
						var id = $(this).attr('id');
						removeItem(id, items, existingItems);
						$(this).parent().parent().remove();
						regenerateIDs();
					});
					date();
					$('.payment_invoices_row').mouseover(function() {
						$(this).css({
							backgroundColor : '#E7EBF0'
						});
					});
					$('.payment_invoices_row').mouseout(function() {
						$(this).css({
							backgroundColor : 'white'
						});
					});

					$('.invoice_checkbox input')
							.click(
									function() {
										$('#invoice_amount_field')
												.val(
														$(this)
																.parent()
																.parent()
																.children()
																.children(
																		'.selected_invoice_amount')
																.text());
									});

					$('.clickable_invoice_td').click(
							function() {
								$(this).parent().children('.invoice_checkbox')
										.children('input').trigger('click');

								/*
								 * var input =
								 * $(this).parent().children('.invoice_checkbox').children('input');
								 * if(input.attr('checked')==true) {
								 * input.attr('checked', false);
								 * //removeInvoice($(this).children(".invoice_id").text(),
								 * invoicesCounter); //invoicesCounter--; }
								 * else{ input.attr('checked', true);
								 * //addInvoice($(this).children(".invoice_id").text(),
								 * invoicesCounter); //invoicesCounter++; }
								 */
							});

					$('.select_invoice_payway')
							.click(
									function() {
										var indate = "";
										var inamount = "";
										$(
												'.payment_shared_fields .fieldwrapper')
												.each(
														function() {
															if ($(this)
																	.children(
																			'.fieldinput')
																	.children(
																			'input')
																	.attr(
																			'name') == "fld_payment_amount") {
																inamount = $(
																		this)
																		.children(
																				'.fieldinput')
																		.children(
																				'input')
																		.val();
															} else if ($(this)
																	.children(
																			'.fieldinput')
																	.children(
																			'input')
																	.attr(
																			'name') == "fld_payment_date") {
																indate = $(this)
																		.children(
																				'.fieldinput')
																		.children(
																				'input')
																		.val();
															}
														});
										if ($(this).val() == '10') {
											if ($('.payment_cash_form')
													.children(
															'.payment_shared_fields')
													.hasClass('empty')) {
												var shared_fields = $(
														'.payment_cheque_form')
														.children(
																'.payment_shared_fields')
														.html();
												$('.payment_cheque_form')
														.children(
																'.payment_shared_fields')
														.empty();
												$('.payment_cash_form')
														.children(
																'.payment_shared_fields')
														.append(shared_fields);
												$('.payment_cash_form')
														.children(
																'.payment_shared_fields')
														.removeClass('empty');
												$('.payment_cheque_form')
														.children(
																'.payment_shared_fields')
														.addClass('empty');
												$(
														'.payment_shared_fields .fieldwrapper')
														.each(
																function() {
																	if ($(this)
																			.children(
																					'.fieldinput')
																			.children(
																					'input')
																			.attr(
																					'name') == "fld_payment_amount") {
																		$(this)
																				.children(
																						'.fieldinput')
																				.children(
																						'input')
																				.val(
																						inamount);
																	} else if ($(
																			this)
																			.children(
																					'.fieldinput')
																			.children(
																					'input')
																			.attr(
																					'name') == "fld_payment_date") {
																		$(this)
																				.children(
																						'.fieldinput')
																				.children(
																						'input')
																				.val(
																						indate);
																	}
																});
											}
											$('.payment_cash_form').slideDown();
											$('.payment_cheque_form').slideUp();
											date();
										} else if ($(this).val() == '1') {
											if ($('.payment_cheque_form')
													.children(
															'.payment_shared_fields')
													.hasClass('empty')) {
												var shared_fields = $(
														'.payment_cash_form')
														.children(
																'.payment_shared_fields')
														.html();
												$('.payment_cash_form')
														.children(
																'.payment_shared_fields')
														.empty();
												$('.payment_cheque_form')
														.children(
																'.payment_shared_fields')
														.append(shared_fields);
												$('.payment_cheque_form')
														.children(
																'.payment_shared_fields')
														.removeClass('empty');
												$('.payment_cash_form')
														.children(
																'.payment_shared_fields')
														.addClass('empty');
												$(
														'.payment_shared_fields .fieldwrapper')
														.each(
																function() {
																	if ($(this)
																			.children(
																					'.fieldinput')
																			.children(
																					'input')
																			.attr(
																					'name') == "fld_payment_amount") {
																		$(this)
																				.children(
																						'.fieldinput')
																				.children(
																						'input')
																				.val(
																						inamount);
																	} else if ($(
																			this)
																			.children(
																					'.fieldinput')
																			.children(
																					'input')
																			.attr(
																					'name') == "fld_payment_date") {
																		$(this)
																				.children(
																						'.fieldinput')
																				.children(
																						'input')
																				.val(
																						indate);
																	}
																});
											}
											$('.payment_cash_form').slideUp();
											$('.payment_cheque_form')
													.slideDown();
											date();
										}
									});

					$('.empty_date').live('click', function() {
						$(this).parent().children('input.date-pick').val("");
					});

					$('#payment_add_invoice')
							.click(
									function() {
										showLighbox();
										var customer = $(
												'#customer_query_string')
												.text();
										var customerID = $(
												'#customer_id_query_string')
												.text();
										if (!paymentDoneJSON) {
											$
													.getJSON(
															'./payment?action=list_unpaid_inv&'
																	+ customer
																	+ '='
																	+ customerID
																	+ '&callback=?',
															function(data) {
																if (data != null) {
																	generateInvoicesTable(data);
																	$(
																			'#lightbox')
																			.css(
																					{
																						display : 'none'
																					});
																} else {
																	alert('Internal Server Error');
																}
															});
										} else {
											$.each(invoices, function(index,
													value) {
												$.each(value, function(index2,
														value2) {
													alert(value2);
												});
											});

										}
									});

					$('.payment_available_invoices_tr').live('mouseover',
							function() {
								$(this).css({
									backgroundColor : '#E7EBF0'
								});
							});

					$('.payment_available_invoices_tr').live('mouseout',
							function() {
								$(this).css({
									backgroundColor : 'white'
								});
							});

					$('.payment_available_invoices_tr')
							.live(
									'click',
									function() {
										;
										var payment = $('#payment_query_string')
												.text();
										var invoice = $('#invoice_query_string')
												.text();
										var paymentId = $(
												'#payment_id_query_string')
												.text();
										var invoiceId = $(this).children(
												'#attach_invoice_id').text();
										var invoiceDate = $(this).children(
												'#attach_invoice_date').text();
										var invoiceAmount = $(this).children(
												'#attach_invoice_amount')
												.text();
										var invoiceTotalAmount = $(this)
												.children(
														'#attach_invoice_total_amount')
												.text();
										showLighbox();
										$
												.getJSON(
														'./payment?action=link&'
																+ invoice + '='
																+ invoiceId
																+ '&' + payment
																+ '='
																+ paymentId
																+ '&callback=?',
														function(data) {
															if (data == 901) {
																alert($(
																		'#greater_invoice_error')
																		.text());
															} else if (data != null) {
																addInvoiceRow(
																		invoiceId,
																		invoiceDate,
																		data['balance'],
																		invoiceTotalAmount);
																showHideLink();
																$(
																		'#payemnt_amount_changeable')
																		.text(
																				data['amount']);
																$(
																		'#payemnt_balance_changeable')
																		.text(
																				data['balance']);
																$(
																		'#changeable_payment_balance')
																		.text(
																				data['balance']);
																var balance = parseInt(
																		$(
																				'#changeable_payment_balance')
																				.text(),
																		10);
																if (data['can_pay_more'] == true) {
																	$(
																			'#payment_add_invoice')
																			.show();
																	$(this)
																			.remove();
																} else {
																	$(
																			'#payment_add_invoice')
																			.hide();
																}
																if (balance == 0) {
																	$(
																			'#payment_add_invoice')
																			.hide();
																} else {
																	$(
																			'#payment_add_invoice')
																			.show();
																}
																$(
																		'.payment_available_invoices')
																		.remove();
															} else {
																alert('Internal Server Error');
															}
															$('#lightbox')
																	.css(
																			{
																				display : 'none'
																			});
														});
									});

					$('.remove_invoice')
							.live(
									'click',
									function() {
										var clickedRow = $(this).parent()
												.parent();
										var payment = $('#payment_query_string')
												.text();
										var invoice = $('#invoice_query_string')
												.text();
										var paymentId = $(
												'#payment_id_query_string')
												.text();
										var invoiceId = $(this).parent()
												.parent().children(
														'.attached_invoice_id')
												.text();
										showLighbox();
										;
										$
												.getJSON(
														'./payment?action=unlink&'
																+ invoice + '='
																+ invoiceId
																+ '&' + payment
																+ '='
																+ paymentId
																+ '&callback=?',
														function(data) {
															if (data != null) {
																$(
																		'#payemnt_amount_changeable')
																		.text(
																				data['amount']);
																$(
																		'#payemnt_balance_changeable')
																		.text(
																				data['balance']);
																if (data['can_pay_more'] == true) {
																	$(
																			'#payment_add_invoice')
																			.show();
																} else {
																	$(
																			'#payment_add_invoice')
																			.hide();
																}
																clickedRow
																		.remove();
																showHideLink();
															} else {
																alert('Internal Server Error');
															}
															$(
																	'.payment_available_invoices')
																	.remove();
															$('#lightbox')
																	.css(
																			{
																				display : 'none'
																			});
														});
									});

					$(".listing_table tr").mouseover(function() {
						$(this).css({
							backgroundColor : "#E7EBF0"
						});
					});

					$(".listing_table tr").mouseout(function() {
						$(this).css({
							backgroundColor : "white"
						});
					});

					$(".update_customer_row").mouseover(function() {
						$(this).css({
							backgroundColor : "#E7EBF0"
						});
					});

					$(".update_customer_row").mouseout(function() {
						$(this).css({
							backgroundColor : "white"
						});
					});

					$('#edit_order_button').click(function() {
						$("#form_action_type").val('edit');
						$('#review_order_form').submit();
					});

					$('#generate_invoice_button').click(function() {
						$('#view_order_action').val('gen_inv');
						$('#view_order_form').submit();
					});

					$('#filtration_box_input').live(
							'keyup',
							function() {
								var myRegExp = new RegExp($(this).val()
										.toUpperCase());
								var string1 = "";
								var matchPos1 = -1;
								$('.otheritemstable table .itemrow').each(
										function() {
											string1 = $(this).children(
													'.search_phrase').text()
													.toUpperCase();
											matchPos1 = string1
													.search(myRegExp);
											if (matchPos1 != -1) {
												$(this).show();
											} else {
												$(this).hide();
											}

										});
							});

					// $('#fld_5').mask('99-999-9999');
					// $('#fld_23').mask('99-999-9999');
					// $('#fld_7').mask('9999-999-999');
					// $('#fld_24').mask('9999-999-999');

					if ($('.enable_fields').text() == "false") {
						$('#enable_the_fields').trigger('click');
					}

					$('.button_container').live('mouseover', function() {
						$(this).children('.button_left').css({
							backgroundPosition : "0 28px"
						});
						$(this).children('.button').children().css({
							backgroundPosition : "0 28px"
						});
						$(this).children('.button_right').css({
							backgroundPosition : "0 28px"
						});
					});

					$('.button_container').live('mouseout', function() {
						$(this).children('.button_left').css({
							backgroundPosition : "0 0"
						});
						$(this).children('.button').children().css({
							backgroundPosition : "0 0"
						});
						$(this).children('.button_right').css({
							backgroundPosition : "0 0"
						});
					});
					$('.button_container').live('mousedown', function() {
						$(this).children('.button_left').css({
							backgroundPosition : "0 56px"
						});
						$(this).children('.button').children().css({
							backgroundPosition : "0 56px"
						});
						$(this).children('.button_right').css({
							backgroundPosition : "0 56px"
						});
					});
					$('.button_container').live('mouseup', function() {
						$(this).children('.button_left').css({
							backgroundPosition : "0 0"
						});
						$(this).children('.button').children().css({
							backgroundPosition : "0 0"
						});
						$(this).children('.button_right').css({
							backgroundPosition : "0 0"
						});
					});

				});

function generateTable(items, state) {
	var html = "";
	items.sort(sortByDescription);
	$.each(items, function(index, value) {
		html += '<tr class="itemrow" id="' + value[0] + '">';
		$.each(value, function(index2, value2) {
			if (index2 == 2) {
				if (value2 == null) {
					html += '<td>';
					html += value[5] + ' %';
					html += '</td>';
				} else {
					html += '<td>';
					html += value2 + ' ';
					if (value[3] == 12) {
						html += $('#currency_shekel').text();
					} else if (value[3] == 1) {
						html += $('#currency_dollar').text();
					}
					html += '</td>';
				}
			} else if (index2 == 1) {
				html += '<td class="description_direction2 search_phrase">';
				html += value2;
				html += '</td>';
			} else if (index2 != 4 && index2 != 3 && index2 != 5 && index2 != 1
					&& index2 != 6 && index2 != 7 && index2 != 8) {
				html += '<td>';
				html += value2;
				html += '</td>';
			}
		});
		html += '</tr>';
	});
	$('.otheritemstable table tr.itemrow').remove();
	$('.otheritemstable table').append(html);

	if (state == 'new') {
		var tableheight = $('.otheritemstable').height();
		var tablewidth = $('.otheritemstable').width();
		var wwidth = (($(window).width() / 2) - (tablewidth / 2));
		var wheight = (($(window).height() / 2) - (tableheight / 2));
		$('#lightbox').empty();
		$('.otheritemstable').css({
			display : 'block',
			left : wwidth,
			top : wheight
		});
	}
}

function addRow(item) {
	var html = "";
	html += '<tr class="existingItemRow">';
	html += '<td class="item_id_td">';
	html += '<input readonly="readonly" value="' + item[0] + '" name=""/>';
	html += '</td>';
	html += '<td class="item_description_td">';
	html += '<input class="description_direction2" readonly="readonly" name="" value="'
			+ item[1] + '"/>';
	html += '</td>';
	if (item[2] == null) {
		html += '<td></td>';
		html += '<td class="item_percentage_td">';
		html += '<input readonly="readonly" name="" value="' + item[5]
				+ '"/> %';
		html += '</td>';
	} else {
		html += '<td class="item_quantity_td">';
		if (item[6] == true) {
			html += '<input name="" value="1"/>';
		} else {
			html += '<input class="price_not_editable" readonly="readonly" name="" value="1"/>';
		}
		html += '</td>';
		html += '<td class="item_price_td">';
		if (item[4] == false || item[7] == false) {
			html += '<input class="price_not_editable" readonly="readonly" name="" value="'
					+ item[2] + '" /> ';

		} else {
			html += '<input name="" value="' + item[2] + '"/> ';
		}
		if (item[3] == 12) {
			html += $('#currency_shekel').text();
		} else if (item[3] == 1) {
			html += $('#currency_dollar').text();
		}
		html += '</td>';
	}
	html += '<td class="item_type_id_td">';
	html += '<input class="manualpricing" type="hidden" name="" value="'
			+ item[4] + '" /> ';
	html += '<input class="quantitable" type="hidden" name="" value="'
			+ item[6] + '" /> ';
	html += '<div class="removeItem" id="' + item[0] + '"></div>';
	html += '</td>';
	html + '</tr>';
	$('.itemstable table').append(html);
}

function addItem(id, items, existingItems) {
	var item = new Array();
	var newItems = new Array();
	var numberOfMonths = 0;
	var invalidItem = false;

	$.each(items, function(index, value) {
		if (value[0] == id) {
			numberOfMonths = value[8];
		}
	});

	if (numberOfMonths > 0) {
		$.each(existingItems, function(index, value) {
			if (value[8] > 0 && numberOfMonths != value[8]) {
				invalidItem = true;
			}
		});
	}
	if (invalidItem == false) {
		if (numberOfMonths > 0) {
			selectDate(numberOfMonths);
		}
		$.each(items, function(index, value) {
			item = items[index];
			if (value[0] == id) {
				existingItems.push(item);
				addRow(item);
			} else {
				newItems.push(item);
			}
		});
		items.length = 0;
		$.each(newItems, function(index, value) {
			items.push(newItems[index]);
		});

		generateTable(items, 're');
		regenerateIDs();
	} else {
		alert($('#gcconstant_different_period_error').text());
	}
}

function removeItem(id, items, existingItems) {
	var item = new Array();
	var newExistingItems = new Array();
	$.each(existingItems, function(index, value) {
		item = existingItems[index];
		if (value[0] == id) {
			items.push(item);
		} else {
			newExistingItems.push(item);
		}
	});
	existingItems.length = 0;
	$.each(newExistingItems, function(index, value) {
		existingItems.push(newExistingItems[index]);
	});
}

function regenerateIDs() {
	var constant_id = $('#gcconstant_item_id').text();
	var constant_price = $('#gcconstant_item_price').text();
	var constant_quantity = $('#gcconstant_item_quantity').text();
	var constant_type_id = $('#gcconstant_item_ismanual').text();
	var constant_type_desc = $('#gcconstant_item_desc').text();
	var constant_percentage_id = $('#gcconstant_item_percentage').text();
	var constant_quant = $('#gcconstant_item_qunt').text();
	var counter = 0;
	$('.itemstable .existingItemRow').each(
			function() {
				$(this).children('.item_id_td').children('input').attr('name',
						constant_id + counter);
				$(this).children('.item_description_td').children('input')
						.attr('name', constant_type_desc + counter);
				$(this).children('.item_quantity_td').children('input').attr(
						'name', constant_quantity + counter);
				$(this).children('.item_price_td').children('input').attr(
						'name', constant_price + counter);
				$(this).children('.item_type_id_td').children(
						'input.manualpricing').attr('name',
						constant_type_id + counter);
				$(this).children('.item_type_id_td').children(
						'input.quantitable').attr('name',
						constant_quant + counter);
				$(this).children('.item_percentage_td').children('input').attr(
						'name', constant_percentage_id + counter);

				counter++;
			});
	$('input#number_of_items_id').val(counter);
}

function initializeItems(items, existingItems) {
	var ids = new Array();
	var newItems = new Array();
	var item = new Array();
	var existingItem = false;
	$('.itemstable tr.existingItemRow').each(function() {
		ids.push($(this).children('.item_id_td').children('input').val());
	});
	$.each(items, function(index, value) {
		item = value;
		$.each(ids, function(index2, value2) {
			if (value[0] == value2) {
				existingItems.push(item);
				existingItem = true;
			}
		});
		if (!existingItem) {
			newItems.push(item);
		}
		existingItem = false;
	});

	items.length = 0;
	$.each(newItems, function(index, value) {
		items.push(value);
	});
}

Date.prototype.monthDays = function() {
	var d = new Date(this.getFullYear(), this.getMonth(), 32);
	return 32 - d.getDate();
};

function date() {
	var D = new Date();
	var Day = D.getDate();
	if (Day == D.monthDays()) {
		D.setDate(1);
		D.setMonth(D.getMonth() + 1);
		D.setDate(D.monthDays());
	} else {

		D.setDate(1);
		D.setMonth(D.getMonth() + 1);
		var numberOfDays = D.monthDays();
		if (numberOfDays < Day) {
			D.setDate(numberOfDays);
		} else {
			D.setDate(Day);
		}
	}

	$('#order_fromdate').bind('dpClosed', function(e, selectedDates) {
		var d = selectedDates[0];
		if (d) {
			d = new Date(d);
			$('#order_todate').dpSetStartDate(d.addDays(1).asString());
		}
	});
	$('#order_todate').bind('dpClosed', function(e, selectedDates) {
		var d = selectedDates[0];
		if (d) {
			d = new Date(d);
			$('#order_fromdate').dpSetEndDate(d.addDays(-1).asString());
		}
	});
	if ($('.date-pick').val() == "") {
		$('.date-pick').datePicker({
			startDate : '01/01/1996',
			clickInput : true
		}).val(new Date().asString()).trigger('change');
		$('#order_todate').val(D.asString()).trigger('change');
		$('#order_fromdate').trigger('click');
		$("#dp-popup .selected").trigger('click');
	} else {
		$('.date-pick').each(function() {
			$(this).datePicker({
				startDate : '01/01/1996',
				clickInput : true
			}).val($(this).val()).trigger('change');
		});
	}
	$('.date-pick2').each(function() {
		$(this).datePicker().val(new Date().asString());
	});

}

function review_order() {
	$('#form_action_type').val('review');
	$('#order_form_id').submit();
}

function create_order() {
	$('#form_action_type').val('create');
	$('#order_form_id').submit();
}

function showLighbox() {
	var dwidth = $(document).width();
	var dheight = $(document).height();
	var wheight = ($(window).height() / 2) - 200;
	$('.loading').css({
		marginTop : wheight,
		display : "block"
	});
	$('#lightbox').css({
		display : 'block',
		height : dheight,
		width : dwidth
	});
}

/*
 * function removeInvoice(id, invoicesCounter){ var found=false; var
 * innerCounter=-1; $('#submited_invoices_ids input').each(function(){
 * if($(this).val()==id){ $(this).remove(); found=true; } if(found){
 * $(this).attr('name', $("#field_invoice_id").text()+innerCounter); }
 * innerCounter++; }); }
 */

/*
 * function addInvoice(id, invoicesCounter){
 * $('#submited_invoices_ids').append('<input
 * name="'+$("#field_invoice_id").text()+invoicesCounter+'" value="'+id+'"/>'); }
 */

/*
 * function getexistingInvoices(existingInvoices){ var id=""; var date=""; var
 * amount=""; $('table.payments_table
 * tr.attached_payment_invoices_row').each(function () { var invoice = new
 * Array(); id = $(this).children('.attached_invoice_id').text();
 * invoice.push(id); date = $(this).children('.attached_invoice_date').text();
 * invoice.push(date); amount =
 * $(this).children('.attached_invoice_amount').text(); invoice.push(amount);
 * existingInvoices.push(invoice); }); }
 */

/*
 * function syncInvoices(existingInvoices, invoices){ var found = false; var
 * newInvoices=new Array(); var invoice= new Array(); $.each(invoices,
 * function(index, value){ $.each(existingInvoices, function(index2, value2){
 * if(value[0]==value2[0]) { found = true; } }); if(!found){
 * newInvoices.push(value); } found=false; });
 * 
 * invoices.length=0; $.each(newInvoices, function(index, value){
 * invoices.push(value); }); }
 */

function generateInvoicesTable(invoices) {
	var html = "";
	html += '<table class="payment_available_invoices">';
	html += '<tr>';
	html += '<th width="100px">';
	html += $('.payments_table tr th.gconstant_invoice_id').text();
	html += '<th width="80px">';
	html += $('.payments_table tr th.gconstant_invoice_date').text();
	html += '</th>';
	html += '<th width="135px">';
	html += $('.gconstant_invoice_left_amount').text();
	html += '</th>';
	html += '<th width="135px">';
	html += $('.payments_table tr th.gconstant_invoice_total_amount').text();
	html += '</th>';
	html += '</th>';
	html += '</tr>';
	$.each(invoices,
			function(index, value) {
				html += '<tr class="payment_available_invoices_tr" id="'
						+ index + '">';
				html += '<td id="attach_invoice_id">' + index + '</td>';
				html += '<td id="attach_invoice_date">' + value["date"]
						+ '</td>';
				html += '<td id="attach_invoice_amount">' + value["amount"]
						+ " " + $(".current_currency").text() + '</td>';
				html += '<td id="attach_invoice_total_amount">'
						+ value["total"] + " " + $(".current_currency").text()
						+ '</td>';
				html += '</tr>';
			});
	html += '</table>';

	$('.payments_left_area').empty().append(html);
}

function addInvoiceRow(invoiceId, invoiceDate, invoiceAmount,
		invoiceTotalAmount) {
	var html = "";
	html += '<tr class="attached_payment_invoices_row">';
	html += '<td class="attached_invoice_id">';
	html += invoiceId;
	html += '</td>';
	html += '<td class="attached_invoice_date">';
	html += invoiceDate;
	html += '</td>';
	html += '<td class="attached_invoice_amount">';
	html += invoiceAmount;
	html += '</td>';
	html += '<td class="attached_invoice_total_amount">';
	html += invoiceTotalAmount;
	html += '</td>';
	html += '<td class="invoice_checkbox">';
	html += '<div class="remove_invoice"></div>';
	html += '</td>';
	html += '</tr>';

	$('.payments_table').append(html);

}

function showHideLink() {
	var counter = 0;
	$('.payments_table tr').each(function() {
		counter++;
	});
	if (counter == 1) {
		$('.submit_payment_button').css({
			display : 'block'
		});
		$('.print_button').css({
			display : 'none'
		});
	} else if (counter > 1) {
		$('.submit_payment_button').css({
			display : 'none'
		});
		$('.print_button').css({
			display : 'block'
		});
	}
}

function openCustomer(cid) {
	var baser_path = "";
	base_path = $("#base_path").text();
	window.location = base_path + "user?action=update&customerId=" + cid;
}

function openOrder(oid) {
	var base_path = "";
	base_path = $('#base_path').text();
	window.location = base_path + "order?action=view&orderId=" + oid;
}

function openInvoice(iid) {
	var base_path = "";
	base_path = $('#base_path').text();
	window.location = base_path + "invoice?action=view&invoiceId=" + iid;
}

function openPayment(pid) {
	var base_path = "";
	base_path = $('#base_path').text();
	window.location = base_path + "payment?action=update&paymentId=" + pid;
}

function enableEditing() {
	$(".field_wrapper").each(function() {
		$(this).children(".input_area").children().attr("disabled", false);
	});

	$(".edit_cstomer_submit .button_container 	").each(function() {
		if ($(this).hasClass('hidden')) {
			$(this).removeClass('hidden');
		} else {
			$(this).addClass('hidden');
		}
	});
}

function openUpdateOrder(oid) {
	var base_path = "";
	base_path = $('#base_path').text();
	window.location = base_path + "order?action=update&orderId=" + oid;
}

function submit_review_order() {
	window.location = '/globalcom/user';
}

function deleting_process() {
	var response = confirm($('.delete_dialog_text').text());
	if (response) {
		return true;
	} else {
		return false;
	}
}

function sortByDescription(a, b) {
	var x = a[1].toLowerCase();
	var y = b[1].toLowerCase();
	return ((x < y) ? -1 : ((x > y) ? 1 : 0));
}

function selectDate(numberOfMonths) {
	var fromDateArray = $('#order_fromdate').val().split('/');
	var fromDate = new Date();
	var fromDay = parseInt(fromDateArray[0], 10);
	var fromMonth = parseInt(fromDateArray[1], 10) - 1;
	var fromYear = parseInt(fromDateArray[2], 10);
	var tempDate = new Date();
	var toDate = new Date();
	var numberOfDays = 0;
	fromDate.setFullYear(fromYear, fromMonth, fromDay);
	var tempMonth = fromMonth;
	var tempYear = fromYear;
	for ( var i = 0; i <= numberOfMonths; i++) {
		if (tempMonth > 11) {
			tempYear++;
			tempMonth = 0;
		}
		tempDate.setFullYear(tempYear, tempMonth, "1");
		if (i == 0) {
			numberOfDays = fromDate.monthDays() - fromDay;
		} else if (i == numberOfMonths) {
			if (fromDay >= tempDate.monthDays()
					|| fromDay == fromDate.monthDays()) {
				numberOfDays += tempDate.monthDays();
			} else {
				numberOfDays += fromDay;
			}
		} else {
			numberOfDays += tempDate.monthDays();
		}
		tempMonth++;
	}

	toDate = new Date(fromDate.getTime() + (numberOfDays * 24 * 60 * 60 * 1000));
	var stringDay = toDate.getDate();
	var stringMonth = toDate.getMonth() + 1;
	var stringYear = toDate.getFullYear();
	if (stringMonth < 10) {
		stringMonth = "0" + stringMonth;
	}
	if (stringDay < 10) {
		stringDay = "0" + stringDay;
	}

	$('#order_todate').val(stringDay + '/' + stringMonth + '/' + stringYear);
}

function indicationChange(report) {
	var state = false;
	if ($("#" + report + "_report").children('.report_title').children(
			".indication").hasClass("minus")) {
		state = true;
	}

	if (state == false) {
		$('.collapseable').each(function() {
			$(this).slideUp();
		});
		$('.indication').each(function() {
			$(this).removeClass('minus').addClass('plus');
		});
		$("#" + report + "_report").children('.report_title').children(
				".indication").removeClass('plus');
		$("#" + report + "_report").children('.report_title').children(
				".indication").addClass('minus');
		$("#" + report + "_report").children('.collapseable').slideDown("slow");

	} else {
		$("#" + report + "_report").children('.report_title').children(
				".indication").removeClass('minus');
		$("#" + report + "_report").children('.report_title').children(
				".indication").addClass('plus');
		$("#" + report + "_report").children('.collapseable').slideUp("slow");
	}
}