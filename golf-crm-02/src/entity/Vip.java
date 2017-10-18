package entity;

public class Vip {
    private String cus_Name;
    
    private String cus_Phone;
    private int pro_Number;
    private String vip_Activationdate;
    private String vip_Expirydate;
    private int vip_Residualequity;

    private int vip_Valid;
    private int vip_Enabled;

    public Vip(String cus_Name,
    		   String cus_Phone,
               int pro_Number,
               String vip_Activationdate,
               String vip_Expirydate,
               int vip_Residualequity,

               int vip_Valid,
               int vip_Enabled) {
        super();
        this.cus_Name = cus_Name;
        this.cus_Phone = cus_Phone;
        this.pro_Number = pro_Number;
        this.vip_Activationdate = vip_Activationdate;
        this.vip_Expirydate = vip_Expirydate;
        this.vip_Residualequity = vip_Residualequity;

        this.vip_Valid = vip_Valid;
        this.vip_Enabled = vip_Enabled;
        
    }

    public Vip() {
        super();
    }

    public String getCus_Name() {
        return cus_Name;
    }

    public void setCus_Name(String cus_Name) {
        this.cus_Name = cus_Name;
    }

    public String getCus_Phone() {
        return cus_Phone;
    }

    public void setCus_Phone(String cus_Phone) {
        this.cus_Phone = cus_Phone;
    }

    public int getPro_Number() {
        return pro_Number;
    }

    public void setPro_Number(int pro_Number) {
        this.pro_Number = pro_Number;
    }

    public String getVip_Activationdate() {
        return vip_Activationdate;
    }

    public void setVip_Activationdate(String vip_Activationdate) {
        this.vip_Activationdate = vip_Activationdate;
    }

    public String getVip_Expirydate() {
        return vip_Expirydate;
    }

    public void setVip_Expirydate(String vip_Expirydate) {
        this.vip_Expirydate = vip_Expirydate;
    }

    public int getVip_Residualequity() {
        return vip_Residualequity;
    }

    public void setVip_Residualequity(int vip_Residualequity) {
        this.vip_Residualequity = vip_Residualequity;
    }

    public int getVip_Valid() {
        return vip_Valid;
    }

    public void setVip_Valid(int vip_Valid) {
        this.vip_Valid = vip_Valid;
    }
    
    public int getVip_Enabled(){
    	return vip_Enabled;
    }
    
    public void setVip_Enabled(int vip_Enabled){
    	this.vip_Enabled = vip_Enabled;
    }
}

