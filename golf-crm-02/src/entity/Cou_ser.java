package entity;

public class Cou_ser {
	
//	产品卡对应的场地信息 场地信息对应的服务信息写在了这里
	
	private int cou_Number;
	private int ser_ServiceID;
	private String ser_Green;
	private int ser_Caddie;
	private int ser_GolfCar;
	private String ser_Catering;
	private int ser_Wardrobe;
	private String ser_Lounge;
	
	public Cou_ser(){
		super();
	}
	public Cou_ser(int cou_Number, int ser_ServiceID, String ser_Green,
			int ser_Caddie, int ser_GolfCar, String ser_Catering,
			int ser_Wardrobe, String ser_Lounge) {
		super();
		this.cou_Number = cou_Number;
		this.ser_ServiceID = ser_ServiceID;
		this.ser_Green = ser_Green;
		this.ser_Caddie = ser_Caddie;
		this.ser_GolfCar = ser_GolfCar;
		this.ser_Catering = ser_Catering;
		this.ser_Wardrobe = ser_Wardrobe;
		this.ser_Lounge = ser_Lounge;
	}
	
	
	public int getCou_Number() {
		return cou_Number;
	}
	public void setCou_Number(int cou_Number) {
		this.cou_Number = cou_Number;
	}
	public int getSer_ServiceID() {
		return ser_ServiceID;
	}
	public void setSer_ServiceID(int ser_ServiceID) {
		this.ser_ServiceID = ser_ServiceID;
	}
	public String getSer_Green() {
		return ser_Green;
	}
	public void setSer_Green(String ser_Green) {
		this.ser_Green = ser_Green;
	}
	public int getSer_Caddie() {
		return ser_Caddie;
	}
	public void setSer_Caddie(int ser_Caddie) {
		this.ser_Caddie = ser_Caddie;
	}
	public int getSer_GolfCar() {
		return ser_GolfCar;
	}
	public void setSer_GolfCar(int ser_GolfCar) {
		this.ser_GolfCar = ser_GolfCar;
	}
	public String getSer_Catering() {
		return ser_Catering;
	}
	public void setSer_Catering(String ser_Catering) {
		this.ser_Catering = ser_Catering;
	}
	public int getSer_Wardrobe() {
		return ser_Wardrobe;
	}
	public void setSer_Wardrobe(int ser_Wardrobe) {
		this.ser_Wardrobe = ser_Wardrobe;
	}
	public String getSer_Lounge() {
		return ser_Lounge;
	}
	public void setSer_Lounge(String ser_Lounge) {
		this.ser_Lounge = ser_Lounge;
	}

	
	
}


	