package com.lj.app.core.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class CompareTwoDateUtil {
	public static final String DATE_TIME_FORMAT = "yyyy-MM-dd hh:mm:ss";
	public static int compareTwoDate(String date1,String date2){
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat(CompareTwoDateUtil.DATE_TIME_FORMAT);
		try {
			calendar1.setTime(df.parse(date1));
			calendar2.setTime(df.parse(date2));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return calendar1.compareTo(calendar2);
	}
	public static int compareTwoDateInSysDate(String date1,String date2){
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		Calendar calendar3 = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat(CompareTwoDateUtil.DATE_TIME_FORMAT);
		Date date = new Date();
		try {
			calendar1.setTime(df.parse(date1));
			calendar2.setTime(df.parse(date2));
			calendar3.getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(calendar3.compareTo(calendar1) < 0){
			return 0;//未生效
		}else if(calendar3.compareTo(calendar2) > 0){
			return 1;//已失效
		}else if(calendar3.compareTo(calendar1) >= 0 && calendar3.compareTo(calendar2) <=0 ){
			return 2;//生效中
		}
		return 2;
	}
	public static int compareTwoDateInSysDate(Date date1,Date date2){
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		Calendar calendar3 = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat(CompareTwoDateUtil.DATE_TIME_FORMAT);
		Date date = new Date();
		try {
			calendar1.setTime(date1);
			calendar2.setTime(date2);
			calendar3.getTime();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(calendar3.compareTo(calendar1) < 0){
			return 0;//未生效
		}else if(calendar3.compareTo(calendar2) > 0){
			return 1;//已失效
		}else if(calendar3.compareTo(calendar1) >= 0 && calendar3.compareTo(calendar2) <=0 ){
			return 2;//生效中
		}
		return 2;
	}
	public static String getDateString(Date date){
		DateFormat df = new SimpleDateFormat(CompareTwoDateUtil.DATE_TIME_FORMAT);
		return df.format(date);
	}
	public static void main(String args[]){
		System.out.println(compareTwoDateInSysDate("2012-10-30 13:02:04","2012-11-09 13:28:44"));
		Calendar calendar4= Calendar.getInstance();
		Date date = new Date();
		calendar4.setTime(date);
		System.out.println(calendar4.getTime());
	}
}

