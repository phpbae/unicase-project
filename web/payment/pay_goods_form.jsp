<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%--jQuery CDN --%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<script type="text/javascript" src="https://api.paygate.net/ajax/common/OpenPayAPI.js"> </script>

<script>

$(function(){
	document.getElementById("pgioRes").click();
});

function getPGIOresult() {
	var replycode = document.PGIOForm.elements['replycode'].value;
	var replyMsg = document.PGIOForm.elements['replyMsg'].value;
	displayStatus(getPGIOElement('ResultScreen'));
	
	if(replycode == "9805"){//replycode == "0000"  0000은 결제 성공을 의미
		document.PGIOForm.action = "PayGoodsResultServlet"; //결제 성공 후 이동할 페이지.
		document.PGIOForm.method = "post";
		document.PGIOForm.submit();
	}else{
	//결제 실패 처리. 0000을 제외한 나머지 code는 모두 결제 실패.
	}
}





</script>
</head>
<%-- 실제 구현시에는 buy_goods_form 에서 입력된 값으로 자동으로 결제화면에 보내준다. --%>
<body>
	<%
		String order_goods_amount = request.getParameter("order_goods_amount");
		String paymethod = request.getParameter("pay_mean");
		String order_delivery_opt = request.getParameter("order_delivery_opt");
		String card_pay_method = null;
		String[] box_num = request.getParameterValues("box_num");
		
		switch(paymethod){	//카드 결제일때만 card종류 파라미터를 받아온다.
		case "1":
			card_pay_method = request.getParameter("card_pay_method");
			switch(card_pay_method){
			//ISP : 안심결제사용 외의 카드
			case "01": case "02": case "03": case "04": case "05": case "06":
			case "07": case "08": case "09": case "10": case "11": case "12": 
			case "13": case "14": case "15": case "16": case "17": case "18": 
				paymethod = "102";
				break;
			//안심: 신한(LG), 삼성, 현대, 롯데, 농협, 씨티, 하나, 신협(현대), 삼성 올앳
			case "19": case "20": case "21": case "22": case "23": case "24": 
			case "25": case "26": case "27": 
				paymethod = "103";
				break;
			}
			break;
		default:
		}
	%>
	<div id="PGIOscreen" style="width:320px">
		<input type="hidden" id="pgioRes" value="OpenPay API" onclick="javascript:doTransaction(document.PGIOForm);">
	</div>
	
	<form name="PGIOForm" >
		<b>mid</b>
		<input size="10" name="mid" value="paygatekr"/>
		<br/>
		
		<b>langcode</b>
		<input name="langcode" value="KR">
		<br/>
		
		
		<input type="hidden" name="order_goods_amount" value="<%=order_goods_amount%>"/>
		<input type="hidden" name="order_delivery_opt" value="<%=order_delivery_opt%>"/>
		
		<b>UTF-8</b>
		<input size=8 name="charset" value="UTF-8"/>
		<br/>

		<b>paymethod (Card_ISP)</b>
		<input name=paymethod value="<%=paymethod%>">
		<br/>
		
		<b>unitprice</b>
		<input size=10 name="unitprice" value="1000"/>
			<input size=10 name=goodcurrency value="WON">
			<br/>
		
		<b>goodname</b><input size="26" name="goodname" value="goodname테스트"/>
		<br/>
		
		<b>name</b><input size="26" name="receipttoname" value="Test name테스트"/>
		<br/>
		
		<b>email</b><input size="26" name="receipttoemail" value="dev@paygate.net"/>
		<br/>
		
		<b>tid</b><input size="26" name="tid" value=""/>
		<br/>
		
		<b>replycode</b><input size="26"  name="replycode" value=""/>
		<br/>
		
		<b>replyMsg</b><input size="26" name="replyMsg" value=""/>
		<br/>
		
		<b>profile_no</b><input size="26" name="profile_no" value=""/>
		<br/>
		
		<b>hashresult</b><input size="26" name="hashresult" value=""/>
		<br/>
		
		<b>riskscore</b><input type=text size="26" name=riskscore value="">
	</form>
 </body>
</html>
