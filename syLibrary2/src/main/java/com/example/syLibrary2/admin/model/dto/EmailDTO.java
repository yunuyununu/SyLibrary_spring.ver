package com.example.syLibrary2.admin.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailDTO {
	private String senderName;
	private String senderMail;
	private String receiveMail;
	private String subject;
	private String message;
}