package com.gls.ppldv.configuration.userException;

public class LoginFailedException extends Exception {
	private static final long serialVersionUID = -330708220896512884L;

	public LoginFailedException(String message) {
		super(message);
	}
}
