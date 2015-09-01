package com.lj.app.core.common.exception;

public class InterfaceException extends Exception {
	private static final long serialVersionUID = 3583566093089790852L;

	public InterfaceException() {
		super();
	}

	public InterfaceException(String e) {
		super(e);
	}

	public InterfaceException(Throwable cause) {
		super(cause);
	}

	public InterfaceException(String message, Throwable cause) {
		super(message, cause);
	}
}