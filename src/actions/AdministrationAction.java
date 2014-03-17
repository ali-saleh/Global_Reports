package actions;

import java.util.Map;

import model.SessionUser;
import interceptors.*;

import com.opensymphony.xwork2.ActionSupport;

public class AdministrationAction extends ActionSupport implements UserAware {

	private static final long serialVersionUID = 5837460494893351128L;
	
	SessionUser user;
	
	@Override
	public void setUser(SessionUser user) {
		this.user = user;
	}
	
	@Override
	public String execute() {
		LOG.info("Inside AdminAction");
		return SUCCESS;
	}
}
