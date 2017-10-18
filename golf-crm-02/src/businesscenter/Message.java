package businesscenter;

public class Message {
	private int ord_Number;
	private String cus_Phone;
	private String mes_Date;
	
	public Message(int ord_Number, String cus_Phone, String mes_Date) {
		super();
		this.ord_Number = ord_Number;
		this.cus_Phone = cus_Phone;
		this.mes_Date = mes_Date;
	}
	
	public Message() {
		super();
	}

	public int getOrd_Number() {
		return ord_Number;
	}
	public void setOrd_Number(int ord_Number) {
		this.ord_Number = ord_Number;
	}
	public String getCus_Phone() {
		return cus_Phone;
	}
	public void setCus_Phone(String cus_Phone) {
		this.cus_Phone = cus_Phone;
	}
	public String getMes_Date() {
		return mes_Date;
	}
	public void setMes_Date(String mes_Date) {
		this.mes_Date = mes_Date;
	}


}
