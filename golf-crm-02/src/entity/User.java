package entity;

public class User {
	private String username;
	private String password;
	private int userType;
	
	
	public User() {
		super();
	}

	public User(String username, String password, String realname, int userType,
			int sex) {
		super();
		this.username = username;
		this.password = password;
		this.userType = userType;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String usrname) {
		this.username = usrname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}


	
	

}
