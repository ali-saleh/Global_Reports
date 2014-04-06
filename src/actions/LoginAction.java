package actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import model.SessionUser;
import model.UserRoles;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import db.logindb.dao.custom.impl.LoginUserDAO;
import db.logindb.model.User;

public class LoginAction extends ActionSupport implements SessionAware,
		ModelDriven<SessionUser> {

	private static final long serialVersionUID = -6190050699323786248L;
    private InputStream inputStream;
    private String username;
	private String password;
	private SessionUser user = new SessionUser();
	private Map<String, Object> sessionAttributes = null;
	
	
	public String test() throws UnsupportedEncodingException {
		inputStream = new ByteArrayInputStream("Hello World! This is a text string response from a Struts 2 Action.".getBytes("UTF-8"));
	    return SUCCESS;
	}

	public InputStream getInputStream() {
        return inputStream;
    }
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String loginUser() {
		LOG.info("User " + username + " is trying to log-in");
		
		User u = authenticate(username, password);

		if (u == null) {
			LOG.info("User " + username + " failed to log-in");
			addActionError(getText("login.error.invalid"));
			return LOGIN;
		}
		
		LOG.debug("User " + username + " logged-in successfully");
		
		System.out.println();
		this.user.setName(u.getUsername());
		this.user.setRole(UserRoles.values()[u.getRole_id()]);

		sessionAttributes.put("USER", this.user);
		
		
		if(user.getRole() == UserRoles.Admin)
			return "admin";
		
		return SUCCESS;
	}
	
	public String logout() {
		LOG.info("User " + user.getName() + " is logging-out");
		sessionAttributes.remove("USER");
		return LOGIN;
	}

	public String execute() throws Exception {
		//LOG.info("This should be called on startup");
		return SUCCESS;
	}

	@Override
	public SessionUser getModel() {
		return user;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		sessionAttributes = session;
	}

	private User authenticate(String user, String password) {
		LoginUserDAO loginUser = new LoginUserDAO();
		User loggedUser = null;
		try {
			loggedUser = loginUser.authenticateUser(user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return loggedUser;
	}
}
