package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {

	public static void alterLocation(String msg, String url, JspWriter out) {
		try {
			String script = ""
						+ "<script>"
						+ "		alert('"+ msg +"');"
						+ "		location.href='"+url+"';"
						+ "</script>";
			out.println(script);
			
		} catch (Exception e) {}
	}
	
	public static void alterBack(String msg, JspWriter out) {
		try {
			String script = ""
						+ "<script>"
						+ "		alert('"+ msg +"');"
						+ "		history.back();"
						+ "</script>";
			out.println(script);
			
		} catch (Exception e) {}		
	}
}
