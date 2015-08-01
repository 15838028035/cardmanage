package com.lj.app.core.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static final String DATE_FOMRAT_yyyyMMddhhMMss = "yyyy-MM-dd hh:mm:ss";
	public static final String DATE_FORMAT_YYYYMMDDHHMMSS ="yyyyMMdd hhmmss";
	
	public static final String getNowDateYYYYMMddHHMMSS() {
		return getNowDate(DATE_FOMRAT_yyyyMMddhhMMss);
	}

	/**得到当前时间
	 * @param format 时间格式
	 * @return
	 */
	public static String getNowDate(String format) {
		SimpleDateFormat sd = new SimpleDateFormat(format);
		String date = sd.format(new Date(System.currentTimeMillis()));
		return date;
	}
	
	/**格式化字符串为Date对象
	 * @param date
	 * @param format
	 * @return
	 */
	public static Date formatDate(String date, String format) {
		SimpleDateFormat sd = new SimpleDateFormat(format);
		Date d = null;
		try {
			d = sd.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return d;
	}
	
	/**格式化Date对象为string
	 * @param date
	 * @param format
	 * @return
	 */
	public static String formatDate(Date date, String format){
        SimpleDateFormat sDateFormat = new SimpleDateFormat(format);
        return sDateFormat.format(date);
	}
	
}
