package com.lj.app.core.common.exception;

public class ParameterNullException extends Exception {
    
    public ParameterNullException() {
        super();
    }

    
    public ParameterNullException(String message) {
        super(message);
    }

    
    public ParameterNullException(String message, Throwable rootCause) {
        super(message, rootCause);
    }

    
    public ParameterNullException(Throwable rootCause) {
        super(rootCause);
    }

    
    public Throwable getRootCause() {
        return getCause();
    }
}

