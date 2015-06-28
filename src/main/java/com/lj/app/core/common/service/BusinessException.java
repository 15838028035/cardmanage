package com.lj.app.core.common.service;

public class BusinessException extends RuntimeException {

	private static final long serialVersionUID = 3583566093089790852L;

	public BusinessException() {
		super();
	}

	public BusinessException(String message) {
		super(message);
	}

	public BusinessException(Throwable cause) {
		super(cause);
	}

	public BusinessException(String message, Throwable cause) {
		super(message, cause);
	}
}
