package entity;

public class Pro_cou {
	
//	产品卡对应的场地信息 场地信息对应的服务信息写在了这里
	
	private int pro_Number;
	private int cou_Number;
	private String cou_Name;
	private String cou_Country;
	private String cou_Province;
	private String cou_City;
	private String cou_Price;
	
	public Pro_cou(){
		super();
	}
	
	public Pro_cou(int pro_Number,int cou_Number, String cou_Name, String cou_Country,
			String cou_Province, String cou_City, String cou_Price) {
		super();
		this.pro_Number = pro_Number;
		this.cou_Number = cou_Number;
		this.cou_Name = cou_Name;
		this.cou_Country = cou_Country;
		this.cou_Province = cou_Province;
		this.cou_City = cou_City;
		this.cou_Price = cou_Price;
	}

	
	public int getPro_Number() {
		return pro_Number = pro_Number;
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

	public String getCou_Name() {
		return cou_Name;
	}

	public void setCou_Name(String cou_Name) {
		this.cou_Name = cou_Name;
	}

	public String getCou_Country() {
		return cou_Country;
	}

	public void setCou_Country(String cou_Country) {
		this.cou_Country = cou_Country;
	}

	public String getCou_Province() {
		return cou_Province;
	}

	public void setCou_Province(String cou_Province) {
		this.cou_Province = cou_Province;
	}

	public String getCou_City() {
		return cou_City;
	}

	public void setCou_City(String cou_City) {
		this.cou_City = cou_City;
	}

	public String getCou_Price() {
		return cou_Price;
	}

	public void setCou_Price(String cou_Price) {
		this.cou_Price = cou_Price;
	}

	
	
}

