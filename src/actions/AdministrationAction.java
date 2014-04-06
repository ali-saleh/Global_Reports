package actions;

import model.SessionUser;
import interceptors.*;

import com.opensymphony.xwork2.ActionSupport;

public class AdministrationAction extends ActionSupport implements UserAware {

	private static final long serialVersionUID = 5837460494893351128L;
	
	private SessionUser user;
	private String page = "reports";
	
	public String getPage() {
		return page;
	}

	@Override
	public void setUser(SessionUser user) {
		this.user = user;
	}
	
	@Override
	public String execute() {
		LOG.info("Inside AdminAction for user " + this.user.getName());
		return SUCCESS;
	}
}
