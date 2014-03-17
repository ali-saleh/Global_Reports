package interceptors;

import model.SessionUser;

public interface UserAware {
	public void setUser(SessionUser user);
}
