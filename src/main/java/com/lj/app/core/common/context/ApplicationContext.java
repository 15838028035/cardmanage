package com.lj.app.core.common.context;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContext {
    
    private static final ClassPathXmlApplicationContext ac ;
    
    static{
        ac = new ClassPathXmlApplicationContext("classpath:/spring-base.xml");     
    }
    
    public static ClassPathXmlApplicationContext getApplicationContext(){
        return ac;
    }
}
