package businesscenter;

public class Birthday {
	private String cus_Name;
	private String cus_Phone;
	private String cus_Birthday;
	private String cus_Address;
	private String cus_Email;
	private String cus_Interest;
	private int Grade;
	public Birthday(String cus_Name, String cus_Phone, String cus_Birthday,
			String cus_Address, String cus_Email, String cus_Interest, int grade) {
		super();
		this.cus_Name = cus_Name;
		this.cus_Phone = cus_Phone;
		this.cus_Birthday = cus_Birthday;
		this.cus_Address = cus_Address;
		this.cus_Email = cus_Email;
		this.cus_Interest = cus_Interest;
		Grade = grade;
	}
	public String getCus_Name() {
		return cus_Name;
	}
	public void setCus_Name(String cus_Name) {
		this.cus_Name = cus_Name;
	}
	public String getCus_Phone() {
		return cus_Phone;
	}
	public void setCus_Phone(String cus_Phone) {
		this.cus_Phone = cus_Phone;
	}
	public String getCus_Birthday() {
		return cus_Birthday;
	}
	public void setCus_Birthday(String cus_Birthday) {
		this.cus_Birthday = cus_Birthday;
	}
	public String getCus_Address() {
		return cus_Address;
	}
	public void setCus_Address(String cus_Address) {
		this.cus_Address = cus_Address;
	}
	public String getCus_Email() {
		return cus_Email;
	}
	public void setCus_Email(String cus_Email) {
		this.cus_Email = cus_Email;
	}
	public String getCus_Interest() {
		return cus_Interest;
	}
	public void setCus_Interest(String cus_Interest) {
		this.cus_Interest = cus_Interest;
	}
	public int getGrade() {
		return Grade;
	}
	public void setGrade(int grade) {
		Grade = grade;
	}
	
	
}
