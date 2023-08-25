<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");

BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num);

//로그인 사용자 ID
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;

if(sessionId.equals(dto.getId())){ //작성자 본인인지 확인
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	dao.close();
	
	//성공 실패 처리
	if(delResult == 1){
		JSFunction.alterLocation("삭제되었습니다.", "List.jsp", out);
	}else{
		JSFunction.alterBack("삭제에 실패하였습니다.", out);
	}
}
else{
	JSFunction.alterBack("본인만 삭제할 수 있습니다.", out);
	
	return;
}

%>