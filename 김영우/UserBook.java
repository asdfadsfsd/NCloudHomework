package review.weeks03;

public class UserBook {

	public UserBook() {
		
	}
	
	public User[] userArr = new User[100];
	public int index;
	
	public void saveUserInfo(String username, String password) {

		User us = new User();
		us.setId(index+1);
		us.setUsername(username);
		us.setPassword(password);
		userArr[index] = us;

	}

}
