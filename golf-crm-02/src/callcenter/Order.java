package callcenter;

public class Order {
	private String view_vip_Name;
	private String view_cus_Phone;
	private int view_pro_Number;
	private int view_vip_Residualdate;//会员卡过期
	private int view_vip_Residualequity;//会员卡剩余权益
	private int view_vip_Enabled;//综合会员有效性
	
	
	public Order(){
		super();
	}

	public Order(String view_vip_Name, String view_cus_Phone,
			int view_pro_Number, int view_vip_Residualdate,
			int view_vip_Residualequity, int view_vip_Enabled) {
		super();
		this.view_vip_Name = view_vip_Name;
		this.view_cus_Phone = view_cus_Phone;
		this.view_pro_Number = view_pro_Number;
		this.view_vip_Residualdate = view_vip_Residualdate;
		this.view_vip_Residualequity = view_vip_Residualequity;
		this.view_vip_Enabled = view_vip_Enabled;
	}

	public String getView_vip_Name() {
		return view_vip_Name;
	}

	public void setView_vip_Name(String view_vip_Name) {
		this.view_vip_Name = view_vip_Name;
	}

	public String getView_cus_Phone() {
		return view_cus_Phone;
	}

	public void setView_cus_Phone(String view_cus_Phone) {
		this.view_cus_Phone = view_cus_Phone;
	}

	public int getView_pro_Number() {
		return view_pro_Number;
	}

	public void setView_pro_Number(int view_pro_Number) {
		this.view_pro_Number = view_pro_Number;
	}

	public int getView_vip_Residualdate() {
		return view_vip_Residualdate;
	}

	public void setView_vip_Residualdate(int view_vip_Residualdate) {
		this.view_vip_Residualdate = view_vip_Residualdate;
	}

	public int getView_vip_Residualequity() {
		return view_vip_Residualequity;
	}

	public void setView_vip_Residualequity(int view_vip_Residualequity) {
		this.view_vip_Residualequity = view_vip_Residualequity;
	}

	public int getView_vip_Enabled() {
		return view_vip_Enabled;
	}

	public void setView_vip_Enabled(int view_vip_Enabled) {
		this.view_vip_Enabled = view_vip_Enabled;
	}
	
	
}
