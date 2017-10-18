package entity;

public class Product {
	private int pro_Number;
	private String pro_Name;
	private int pro_Validitydate;
	private String pro_Price;
	private	int pro_Equity;
	private int pro_Weekdays_times;
	private int pro_Holiday_times;
	private int pro_Peoplelimit;
	private int pro_Enabled;
	
	public Product(){
		super();
	}

	public Product(int pro_Number, String pro_Name, int pro_Validitydate,
			String pro_Price, int pro_Equity, int pro_Weekdays_times,
			int pro_Holiday_times,int pro_Enabled) {
		super();
		this.pro_Number = pro_Number;
		this.pro_Name = pro_Name;
		this.pro_Validitydate = pro_Validitydate;
		this.pro_Price = pro_Price;
		this.pro_Equity = pro_Equity;
		this.pro_Weekdays_times = pro_Weekdays_times;
		this.pro_Holiday_times = pro_Holiday_times;
		this.pro_Enabled = pro_Enabled;
	}

	public int getPro_Number() {
		return pro_Number;
	}

	public void setPro_Number(int pro_Number) {
		this.pro_Number = pro_Number;
	}

	public String getPro_Name() {
		return pro_Name;
	}

	public void setPro_Name(String pro_Name) {
		this.pro_Name = pro_Name;
	}

	public String getPro_Price() {
		return pro_Price;
	}

	public void setPro_Price(String pro_Price) {
		this.pro_Price = pro_Price;
	}

	public int getPro_Equity() {
		return pro_Equity;
	}

	public void setPro_Equity(int pro_Equity) {
		this.pro_Equity = pro_Equity;
	}

	public int getPro_Holiday_times() {
		return pro_Holiday_times;
	}

	public void setPro_Holiday_times(int pro_Holiday_times) {
		this.pro_Holiday_times = pro_Holiday_times;
	}

	public int getPro_Validitydate() {
		return pro_Validitydate;
	}

	public void setPro_Validitydate(int pro_Validitydate) {
		this.pro_Validitydate = pro_Validitydate;
	}

	public int getPro_Weekdays_times() {
		return pro_Weekdays_times;
	}

	public void setPro_Weekdays_times(int pro_Weekdays_times) {
		this.pro_Weekdays_times = pro_Weekdays_times;
	}

	public int getPro_Peoplelimit() {
		return pro_Peoplelimit;
	}

	public void setPro_Peoplelimit(int pro_Peoplelimit) {
		this.pro_Peoplelimit = pro_Peoplelimit;
	}
	
	public int getPro_Enabled(){
		return pro_Enabled;
	}
	
	public void setPro_Enabled(int pro_Enabled){
		this.pro_Enabled = pro_Enabled;
	}
	
}
	

