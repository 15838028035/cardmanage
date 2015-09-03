package com.lj.app.core.common.util;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.notify.email.EmailSenderFactory;
import com.lj.app.core.common.notify.email.IEmailSender;

public class NoticeUtilTest {
	
	@Before
	public void setUp() {
		NoticeUtil.setDefaultEmailSender(EmailSenderFactory.createEmailSenderImpl());
		String name = NoticeUtil.getDefaultEmailSender().getClass().getName();
		assertTrue(name.contains("EmailSenderImpl"));
	}
	
	@Test
	public void sendEmailTest() {
		NoticeUtil.setEmailSender(null);
		boolean sendResult = NoticeUtil.sendEmail("emailAddress", "title", "content");
		assertFalse(sendResult);
	}

	@Test
	public void sendEmailFakeTest() {
		NoticeUtil.setEmailSender(new IEmailSenderFake());
		boolean sendResult = NoticeUtil.sendEmail("emailAddress", "title", "content");
		assertTrue(sendResult);
	}
	
	@Test(expected=Exception.class)
	public void sendEmailExceptionTest() {
		NoticeUtil.setEmailSender(new IEmailSenderException());
		boolean sendResult = NoticeUtil.sendEmail("emailAddress", "title", "content");
		assertFalse(sendResult);
	}
	

	private class IEmailSenderFake implements IEmailSender{

		@Override
		public boolean sendEmail(String sendTo, String subject, String content) {
			return true;
		}
		
	}
	
	private class IEmailSenderException implements IEmailSender{

		@Override
		public boolean sendEmail(String sendTo, String subject, String content) {
			try{
				throw new Exception("Send email exception");
			}catch(Exception e) {
				
			}
			return true;
		}
		
	}
}
