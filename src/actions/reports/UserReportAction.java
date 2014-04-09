package actions.reports;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import com.opensymphony.xwork2.ActionSupport;

public class UserReportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9010796324682946356L;
	
	private String page = "user";
	
	private InputStream inputStream;
	private String search;
	private String res;

	private String greeting;

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	
	public String test() throws UnsupportedEncodingException {

		setGreeting("Searching for: " + search);

	    return ActionSupport.SUCCESS;
	}
	
//	public String test() throws UnsupportedEncodingException {
//
//		if (search.contains("ali")) {
//			res = "Hi From Ali";
//		} else {
//			res = "not hi";
//		}
//		inputStream = new ByteArrayInputStream(
//				"Hello World! This is a text string response from a Struts 2 Action.".getBytes("UTF-8"));
//		return SUCCESS;
//	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getRes() {
		return res;
	}

	public void setRes(String res) {
		this.res = res;
	}


	public String getGreeting() {
		return greeting;
	}


	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
	
	public String getPage() {
		return this.page;
	}
}
