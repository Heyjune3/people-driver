package com.gls.ppldv.user.dto;

import lombok.Data;

@Data
public class LoginDTO {

	private String email;
	private String password;
	private boolean checked;

}
