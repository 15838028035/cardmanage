package com.lj.app.core.common.notify.email;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 调用方法： 
 * 		IEmailSender emailSender = EmailSenderFactory.createEmailSenderImpl(); 
 * 		boolean isSuccess = emailSender.sendEmail("目标邮箱地址","邮件标题", "邮件正文内容");
 * 
 */

public class EmailSenderImpl implements IEmailSender {
	private static Log logger = LogFactory.getLog(EmailSenderImpl.class);

	public EmailSenderImpl() {
		
	}

	//FIXME: 修改地址
	@Override
	public boolean sendEmail(String sendTo, String subject, String content) {
		try {
			if(sendTo==null||sendTo.equals(""))
			{	
				logger.warn("======mail address is null,not send mail======");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} 
		return true;
	}
}

