package interceptors;

import java.util.Map;

import model.*;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AdminInterceptor implements Interceptor {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		Map<String, Object> sessionAttributes = actionInvocation.getInvocationContext().getSession();
		SessionUser user = (SessionUser) sessionAttributes.get("USER");

		if (user == null) {
			return Action.LOGIN;
		} else if (user.getRole() != UserRoles.Admin) {
			System.out.println("Inside AdminInterceptor: Not admin user");
			return Action.ERROR;
		} else {
			System.out.println("Inside AdminInterceptor");
			return actionInvocation.invoke();
		}
	}
}
