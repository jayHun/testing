package com.team10.memberEntity;

public class MemberEntity {
	
	private String memberEmail;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberType;  
    private String memberWallet;
	
    
    
    public MemberEntity() {
		super();
		
	}
    
    
    public MemberEntity(String memberEmail, String memberPw, String memberName,
			String memberPhone, String memberType, String memberWallet) {
		super();
		this.memberEmail = memberEmail;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberType = memberType;
		this.memberWallet = memberWallet;
	}



	public String getMemberEmail() {
		return memberEmail;
	}



	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}



	public String getMemberPw() {
		return memberPw;
	}



	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getMemberPhone() {
		return memberPhone;
	}



	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}



	public String getMemberType() {
		return memberType;
	}



	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}



	public String getMemberWallet() {
		return memberWallet;
	}



	public void setMemberWallet(String memberWallet) {
		this.memberWallet = memberWallet;
	}
	
	
}
