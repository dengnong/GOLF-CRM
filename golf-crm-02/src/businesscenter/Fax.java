package businesscenter;

public class Fax {
		private int ord_Number;
		private String cus_Phone;
		private int cou_Number;
		private int ser_ServiceID;
		private String ord_ReDate;
		private float ord_Price;
		
		public Fax(int ord_Number, String cus_Phone, int cou_Number,
				int ser_ServiceID, String ord_ReDate, float ord_Price) {
			super();
			this.ord_Number = ord_Number;
			this.cus_Phone = cus_Phone;
			this.cou_Number = cou_Number;
			this.ser_ServiceID = ser_ServiceID;
			this.ord_ReDate = ord_ReDate;
			this.ord_Price = ord_Price;
		}
		
		public Fax() {
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
		public String getOrd_ReDate() {
			return ord_ReDate;
		}
		public void setOrd_ReDate(String ord_ReDate) {
			this.ord_ReDate = ord_ReDate;
		}
		public float getOrd_Price() {
			return ord_Price;
		}
		public void setOrd_Price(float ord_Price) {
			this.ord_Price = ord_Price;
		}
		
	
	

}
