package dto.admin;

import java.sql.Date;

public class MemberDTO {
	//공통
	private String id;
	private String name;
	private String info;
	private Date regDate;
	
	//수치
	private Integer clientCount;
	private Long calculation;
	
	//회원 탭 전용
	private String partnerTrainer;
	private Long payment;
	
}
