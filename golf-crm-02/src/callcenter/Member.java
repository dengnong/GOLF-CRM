package callcenter;

public class Member {
	private int ord_Number;
	private String ord_Phone;
	private String ord_Name;
	private int ord_Message;
	public int getOrd_Message() {
		return ord_Message;
	}

	public void setOrd_Message(int ord_Message) {
		this.ord_Message = ord_Message;
	}

	public Member(int ord_Number, String ord_Phone, String ord_Name,
			int ord_Message) {
		super();
		this.ord_Number = ord_Number;
		this.ord_Phone = ord_Phone;
		this.ord_Name = ord_Name;
		this.ord_Message = ord_Message;
	}

	public Member(int ord_Number, String ord_Phone) {
		super();
		this.ord_Number = ord_Number;
		this.ord_Phone = ord_Phone;
	}
	
	public Member(int ord_Number,String ord_Phone,String ord_Name){
		super();
		this.ord_Number=ord_Number;
		this.ord_Phone=ord_Phone;
		this.ord_Name=ord_Name;
		
	}
	public int getOrd_Number() {
		return ord_Number;
	}
	public void setOrd_Number(int ord_Number) {
		this.ord_Number = ord_Number;
	}
	public String getOrd_Phone() {
		return ord_Phone;
	}
	public void setOrd_Phone(String ord_Phone) {
		this.ord_Phone = ord_Phone;
	}
	public String getOrd_Name() {
		return ord_Name;
	}
	public void setOrd_Name(String ord_Name) {
		this.ord_Name = ord_Name;
	}
	
	
	
}
