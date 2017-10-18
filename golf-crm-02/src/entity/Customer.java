package entity;

public class Customer {
	private String cus_Phone;
	private String cus_Name;
	private String cus_Sex;
	private int cus_Status;
	private String cus_Birthday;
	private String cus_Email;
	private String cus_Address;
	private String cus_Postcode;//邮编
	private String cus_Nativeplace;//籍贯
	private String cus_City;//城市
	private String cus_Prouince;//省份
	private String cus_Nationallity;//国籍
	private String cus_Position;//职务
	private String cus_Cardtype;//证件类型
	private String cus_Postnumber;//证件号码
	private String cus_interest;
	private int cus_Enabled;
	
	

	public Customer(String cus_Phone, String cus_Name, String cus_Sex,
			int cus_Status, String cus_Birthday, String cus_Email,
			String cus_Address, String cus_Postcode, String cus_Nativeplace,
			String cus_City, String cus_Prouince, String cus_Nationallity,
			String cus_Position, String cus_Cardtype, String cus_Postnumber,
			String cus_interest,int cus_Enabled) {
		super();
		this.cus_Phone = cus_Phone;
		this.cus_Name = cus_Name;
		this.cus_Sex = cus_Sex;
		this.cus_Status = cus_Status;
		this.cus_Birthday = cus_Birthday;
		this.cus_Email = cus_Email;
		this.cus_Address = cus_Address;
		this.cus_Postcode = cus_Postcode;
		this.cus_Nativeplace = cus_Nativeplace;
		this.cus_City = cus_City;
		this.cus_Prouince = cus_Prouince;
		this.cus_Nationallity = cus_Nationallity;
		this.cus_Position = cus_Position;
		this.cus_Cardtype = cus_Cardtype;
		this.cus_Postnumber = cus_Postnumber;
		this.cus_interest = cus_interest;
		this.cus_Enabled = cus_Enabled;
	}

	public Customer(){
		super();
	}

	public String getCus_Phone() {
		return cus_Phone;
	}

	public void setCus_Phone(String cus_Phone) {
		this.cus_Phone = cus_Phone;
	}

	public String getCus_Name() {
		return cus_Name;
	}

	public void setCus_Name(String cus_Name) {
		this.cus_Name = cus_Name;
	}

	public String getCus_Sex() {
		return cus_Sex;
	}

	public void setCus_Sex(String cus_Sex) {
		this.cus_Sex = cus_Sex;
	}

	public int getCus_Status() {
		return cus_Status;
	}

	public void setCus_Status(int cus_Status) {
		this.cus_Status = cus_Status;
	}

	public String getCus_Birthday() {
		return cus_Birthday;
	}

	public void setCus_Birthday(String cus_Birthday) {
		this.cus_Birthday = cus_Birthday;
	}

	public String getCus_Email() {
		return cus_Email;
	}

	public void setCus_Email(String cus_Email) {
		this.cus_Email = cus_Email;
	}

	public String getCus_Address() {
		return cus_Address;
	}

	public void setCus_Address(String cus_Address) {
		this.cus_Address = cus_Address;
	}

	public String getCus_Postcode() {
		return cus_Postcode;
	}

	public void setCus_Postcode(String cus_Postcode) {
		this.cus_Postcode = cus_Postcode;
	}

	public String getCus_Nativeplace() {
		return cus_Nativeplace;
	}

	public void setCus_Nativeplace(String cus_Nativeplace) {
		this.cus_Nativeplace = cus_Nativeplace;
	}

	public String getCus_City() {
		return cus_City;
	}

	public void setCus_City(String cus_City) {
		this.cus_City = cus_City;
	}

	public String getCus_Prouince() {
		return cus_Prouince;
	}

	public void setCus_Prouince(String cus_Prouince) {
		this.cus_Prouince = cus_Prouince;
	}

	public String getCus_Nationallity() {
		return cus_Nationallity;
	}

	public void setCus_Nationallity(String cus_Nationallity) {
		this.cus_Nationallity = cus_Nationallity;
	}

	public String getCus_Position() {
		return cus_Position;
	}

	public void setCus_Position(String cus_Position) {
		this.cus_Position = cus_Position;
	}

	public String getCus_Cardtype() {
		return cus_Cardtype;
	}

	public void setCus_Cardtype(String cus_Cardtype) {
		this.cus_Cardtype = cus_Cardtype;
	}

	public String getCus_Postnumber() {
		return cus_Postnumber;
	}

	public void setCus_Postnumber(String cus_Postnumber) {
		this.cus_Postnumber = cus_Postnumber;
	}

	public String getCus_interest() {
		return cus_interest;
	}

	public void setCus_interest(String cus_interest) {
		this.cus_interest = cus_interest;
	}
	
	public int getCus_Enabled(){
		return cus_Enabled;
	}
	
	public void setCus_Enabled(int cus_Enabled){
		this.cus_Enabled = cus_Enabled;
	}
}