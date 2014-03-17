package interceptors;

import java.util.Map;

import model.SessionUser;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AuthenticationInterceptor implements Interceptor {

	private static final long serialVersionUID = 2L;

	@Override
	public void destroy() {
		// release resources here
	}

	@Override
	public void init() {
		// create resources here
	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		
		Map<String, Object> sessionAttributes = actionInvocation.getInvocationContext().getSession();
		SessionUser user = (SessionUser) sessionAttributes.get("USER");

		if (user == null) {
			return Action.LOGIN;
		} else {
			System.out.println("Inside intercptor");
			Object action = actionInvocation.getAction();
			if (action instanceof UserAware) {
				((UserAware) action).setUser(user);
			}
			return actionInvocation.invoke();
		}
	}
}
