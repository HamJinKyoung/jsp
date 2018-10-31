package hjk;

import java.util.Date;

public class MemberInfo {
	
	private String id;
	private String password;
	private String name;
	private String tel;
	private Date registerDate;
	
	public String getId() {
		return id;
	}
	public void setId(String val) {
		this.id = val;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String val) {
		this.password = val;
	}
	public String getName() {
		return name;
	}
	public void setName(String val) {
		this.name = val;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String val) {
		this.tel = val;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setResisterDate(Date val) {
		this.registerDate = val;
	}
}
