package model;

import java.io.Serializable;

public class SessionUser implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String name;
	private UserRoles role;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public UserRoles getRole() {
		return role;
	}
	public void setRole(UserRoles role) {
		this.role = role;
	}
}
