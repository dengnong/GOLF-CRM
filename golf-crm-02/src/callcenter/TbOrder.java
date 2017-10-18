package callcenter;

public class TbOrder {
			private int ord_Number;
			private String vip_Phone;
			private int pro_Number;
			private int cou_Number;
			private int ser_ServiceID;
			private String ord_Date;
			private String ord_ReDate;
			private int ord_State;
			private float ord_Price;
			private int ord_Shouldequity;
			private int ord_Member;
			private int ord_Pay;
			
			public TbOrder(int ord_Number, String vip_Phone, int pro_Number,
					int cou_Number, int ser_ServiceID, String ord_Date,
					String ord_ReDate, int ord_State, float ord_Price,
					int ord_Shouldequity, int ord_Member, int ord_Pay) {
				super();
				this.ord_Number = ord_Number;
				this.vip_Phone = vip_Phone;
				this.pro_Number = pro_Number;
				this.cou_Number = cou_Number;
				this.ser_ServiceID = ser_ServiceID;
				this.ord_Date = ord_Date;
				this.ord_ReDate = ord_ReDate;
				this.ord_State = ord_State;
				this.ord_Price = ord_Price;
				this.ord_Shouldequity = ord_Shouldequity;
				this.ord_Member = ord_Member;
				this.ord_Pay = ord_Pay;
			}
			public int getOrd_Pay() {
				return ord_Pay;
			}
			public void setOrd_Pay(int ord_Pay) {
				this.ord_Pay = ord_Pay;
			}
			public TbOrder(int ord_Number, String vip_Phone, int pro_Number,
					int cou_Number, int ser_ServiceID, String ord_Date,
					String ord_ReDate, int ord_State, float ord_Price,
					int ord_Shouldequity, int ord_Member) {
				super();
				this.ord_Number = ord_Number;
				this.vip_Phone = vip_Phone;
				this.pro_Number = pro_Number;
				this.cou_Number = cou_Number;
				this.ser_ServiceID = ser_ServiceID;
				this.ord_Date = ord_Date;
				this.ord_ReDate = ord_ReDate;
				this.ord_State = ord_State;
				this.ord_Price = ord_Price;
				this.ord_Shouldequity = ord_Shouldequity;
				this.ord_Member = ord_Member;
			}
			public TbOrder() {
				super();
			}
			
			public int getOrd_Number() {
				return ord_Number;
			}

			public void setOrd_Number(int ord_Number) {
				this.ord_Number = ord_Number;
			}

			public String getVip_Phone() {
				return vip_Phone;
			}

			public void setVip_Phone(String vip_Phone) {
				this.vip_Phone = vip_Phone;
			}

			public int getPro_Number() {
				return pro_Number;
			}

			public void setPro_Number(int pro_Number) {
				this.pro_Number = pro_Number;
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

			public String getOrd_Date() {
				return ord_Date;
			}

			public void setOrd_Date(String ord_Date) {
				this.ord_Date = ord_Date;
			}

			public String getOrd_ReDate() {
				return ord_ReDate;
			}

			public void setOrd_ReDate(String ord_ReDate) {
				this.ord_ReDate = ord_ReDate;
			}

			public int getOrd_State() {
				return ord_State;
			}

			public void setOrd_State(int ord_State) {
				this.ord_State = ord_State;
			}

			public float getOrd_Price() {
				return ord_Price;
			}

			public void setOrd_Price(float ord_Price) {
				this.ord_Price = ord_Price;
			}

			public int getOrd_Shouldequity() {
				return ord_Shouldequity;
			}

			public void setOrd_Shouldequity(int ord_Shouldequity) {
				this.ord_Shouldequity = ord_Shouldequity;
			}

			public int getOrd_Member() {
				return ord_Member;
			}

			public void setOrd_Member(int ord_Member) {
				this.ord_Member = ord_Member;
			}

}
