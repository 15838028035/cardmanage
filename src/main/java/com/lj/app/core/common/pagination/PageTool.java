package com.lj.app.core.common.pagination;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

public class PageTool {

	public static String convert(String str) {

		if (str == null || str.equals(""))
			return "";

		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < str.length(); i++) {
			char c = str.charAt(i);

			if (c >= 'A' && c <= 'Z') {
				if (i == 0) {
					sb.append(Character.toLowerCase(c));
				} else {
					sb.append("_" + Character.toLowerCase(c));
				}
			} else {
				sb.append(c);
			}
		}

		return sb.toString();
	}

	public static String pageToJsonJQGrid(Page page) {
		Map<String,Object> mapResult = new HashMap<String,Object>();
		mapResult.put("page", page.getPageNumber());
		mapResult.put("total", page.getTotalPages());
		mapResult.put("records", page.getTotalCount());
		mapResult.put("rows", page.getResult());

		String jsonResult = null;
		JSONObject jsonObj = new JSONObject();
		
		try {
			jsonResult=jsonObj.fromObject(mapResult).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	public static String pageToJsonJQGridWithNoDateFormat(Page page) {
		Map<String,Object> mapResult = new HashMap<String,Object>();
		mapResult.put("page", page.getPageNumber());
		mapResult.put("total", page.getTotalPages());
		mapResult.put("records", page.getTotalCount());
		mapResult.put("rows", page.getResult());
		
		JSONObject jsonObj = new JSONObject();

		String jsonResult = null;
		
		try {
			jsonResult=jsonObj.fromObject(mapResult).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
}
