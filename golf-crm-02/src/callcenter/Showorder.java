package callcenter;

public class Showorder {
	private int ord_NUmber;
	private String cus_Name;
	private String cus_Phone;
	private String pro_Name;
	private String cou_Name;
	private int ser_ServiceID;
	private String ord_ReDate;
	private int ord_Member;
	private float ord_Price;
	private int ord_Shoulequity;
	private String ord_Date;
	public Showorder(int ord_NUmber, String vip_Name, String vip_Phone,
			String pro_Name, String cou_Name, int ser_ServiceID,
			String ord_ReDate, int ord_Member, float ord_Price,
			int ord_Shoulequity, String ord_Date) {
		super();
		this.ord_NUmber = ord_NUmber;
		this.cus_Name = vip_Name;
		this.cus_Phone = vip_Phone;
		this.pro_Name = pro_Name;
		this.cou_Name = cou_Name;
		this.ser_ServiceID = ser_ServiceID;
		this.ord_ReDate = ord_ReDate;
		this.ord_Member = ord_Member;
		this.ord_Price = ord_Price;
		this.ord_Shoulequity = ord_Shoulequity;
		this.ord_Date = ord_Date;
	}
	public int getOrd_Number() {
		return ord_NUmber;
	}
	public void setOrd_Number(int ord_Number) {
		this.ord_NUmber = ord_Number;
	}
	public String getCus_Name() {
		return cus_Name;
	}
	public void setVip_Name(String vip_Name) {
		this.cus_Name = vip_Name;
	}
	public String getCus_Phone() {
		return cus_Phone;
	}
	public void setVip_Phone(String vip_Phone) {
		this.cus_Phone = vip_Phone;
	}
	public String getPro_Name() {
		return pro_Name;
	}
	public void setPro_Name(String pro_Name) {
		this.pro_Name = pro_Name;
	}
	public String getCou_Name() {
		return cou_Name;
	}
	public void setCou_Name(String cou_Name) {
		this.cou_Name = cou_Name;
	}
	public int getSer_ServiceID() {
		return ser_ServiceID;
	}
	public void setSer_ServiceID(int ser_ServiceID) {
		this.ser_ServiceID = ser_ServiceID;
	}
	public String getOrd_ReDate() {
		return ord_ReDate;
	}
	public void setOrd_ReDate(String ord_ReDate) {
		this.ord_ReDate = ord_ReDate;
	}
	public int getOrd_Member() {
		return ord_Member;
	}
	public void setOrd_Member(int ord_Member) {
		this.ord_Member = ord_Member;
	}
	public float getOrd_Price() {
		return ord_Price;
	}
	public void setOrd_Price(float ord_Price) {
		this.ord_Price = ord_Price;
	}
	public int getOrd_Shoulequity() {
		return ord_Shoulequity;
	}
	public void setOrd_Shoulequity(int ord_Shoulequity) {
		this.ord_Shoulequity = ord_Shoulequity;
	}
	public String getOrd_Date() {
		return ord_Date;
	}
	public void setOrd_Date(String ord_Date) {
		this.ord_Date = ord_Date;
	}
	
	
	
}
