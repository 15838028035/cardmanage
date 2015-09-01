package com.lj.app.core.common.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lj.app.core.common.notify.email.EmailSenderFactory;
import com.lj.app.core.common.notify.email.IEmailSender;

public class NoticeUtil {
	
	private static Log log = LogFactory.getLog(NoticeUtil.class);
	
	public static void sendEmail(String emailAddress,String title,String content){
		
		try {
			IEmailSender emailSender = EmailSenderFactory.createEmailSenderImpl();
			emailSender.sendEmail(emailAddress, title, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
