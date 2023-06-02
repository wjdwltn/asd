package animal;

import java.util.Date;

public class Animal {
	private int animalID;
	private String animalTitle;
	private String animalLost;
	private String userPhone;
	private String animalGender;
	private String animalKind;

	
	  private String animalPic;
	  
	  
	  public String getAnimalPic() 
	  { return animalPic; 
	  }
	  public void setAnimalPic(String animalPic) { 
		  this.animalPic = animalPic; 
	  }
	 
	public int getAnimalID() {
		return animalID;
	}
	public void setAnimalID(int animalID) {
		this.animalID = animalID;
	}
	public String getAnimalTitle() {
		return animalTitle;
	}
	public void setAnimalTitle(String animalTitle) {
		this.animalTitle = animalTitle;
	}
	public String getAnimalLost() {
		return animalLost;
	}
	public void setAnimalLost(String animalLost) {
		this.animalLost = animalLost;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getAnimalGender() {
		return animalGender;
	}
	public void setAnimalGender(String animalGender) {
		this.animalGender = animalGender;
	}
	public String getAnimalKind() {
		return animalKind;
	}
	public void setAnimalKind(String animalKind) {
		this.animalKind = animalKind;
	}
	
	
}
