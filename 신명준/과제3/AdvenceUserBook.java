package homework3;


public class AdvenceUserBook {
	
   public BasicUser[] Users = new BasicUser[100];
   public int index=0;
   
   public void saveUserInfo(String username ,String password){
	   
	   BasicUser user = new BasicUser();
	   user.setPassword(password);
	   user.setUsername(username);
	   user.setId(index+1);
	   Users[index] =user;
	   index++;
   }
   
   
}
