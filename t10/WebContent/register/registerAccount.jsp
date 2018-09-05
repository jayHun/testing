<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<input type="hidden" value="${ newAddress }" id="addr"/>
<input type="hidden" value="${ senderName }" id="senderName"/>
<input type="hidden" value="${ senderAddr }" id="senderAddr"/>
<input type="hidden" value="${ senderPhone }" id="senderPhone"/>
<input type="hidden" value="${ receiverName }" id="receiverName"/>
<input type="hidden" value="${ receiverAddr }" id="receiverAddr"/>
<input type="hidden" value="${ receiverPhone }" id="receiverPhone"/>
<input type="hidden" value="${ type }" id="type"/>
<input type="hidden" value="${ price }" id="price"/>

새로운 택배 송장이 발행되었습니다! <br/>
송장 비밀번호: ${ newPassword }<br/>
해쉬 주소: ${ newAddress }<br/><br>

<a href="/t10/auth/authPage?addr=${ newAddress }&infoType=DEL"><img src="/t10/qrcode/${ newAddress }_DEL.png"/></a>
<br/><br/>

Network: ${ clientVersion }

<script type="text/javascript">
	var addr = "'" + $('#addr').val() + "'";
	var senderName = $('#senderName');
	var senderAddr = $('#senderAddr');
	var senderPhone = $('#senderPhone');
	var receiverName = $('#receiverName');
	var receiverAddr = $('#receiverAddr');
	var receiverPhone = $('#receiverPhone');
	var category = $('#type');
	var price = $('#price');
	
	//var addr = '0x5f3e46d770493bb6368fdf42c944807615b04f19';
	console.log(addr);
	var web3 = new Web3("http://10.64.78.19:8545"); 
	web3.setProvider(new web3.providers.HttpProvider("http://10.64.78.19:8545"));
	
	var contractAddr = "0x5d12abac4b960fc26f2a04b1ea3531ba534caca1";
	
	var abi = JSON.parse('[ { "anonymous": false, "inputs": [ { "indexed": false, "name": "category", "type": "string" }, { "indexed": false, "name": "price", "type": "string" } ], "name": "invoiceInfo", "type": "event" }, { "anonymous": false, "inputs": [ { "indexed": false, "name": "recieverName", "type": "string" }, { "indexed": false, "name": "recieverAddr", "type": "string" }, { "indexed": false, "name": "recieverPhone", "type": "string" } ], "name": "receiverInfo", "type": "event" }, { "anonymous": false, "inputs": [ { "indexed": false, "name": "senderName", "type": "string" }, { "indexed": false, "name": "senderAddr", "type": "string" }, { "indexed": false, "name": "senderPhone", "type": "string" } ], "name": "senderInfo", "type": "event" }, { "constant": false, "inputs": [ { "name": "_senderName", "type": "string" }, { "name": "_senderAddr", "type": "string" }, { "name": "_senderPhone", "type": "string" }, { "name": "_recieverName", "type": "string" }, { "name": "_recieverAddr", "type": "string" }, { "name": "_recieverPhone", "type": "string" }, { "name": "_category", "type": "string" }, { "name": "_price", "type": "string" } ], "name": "setInvoice", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "getCategory", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getPrice", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getReceiverAddr", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getReceiverName", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getReceiverPhone", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getSenderAddr", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getSenderName", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getSenderPhone", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [ { "name": "", "type": "address" } ], "name": "InvoiceList", "outputs": [ { "components": [ { "name": "senderName", "type": "string" }, { "name": "senderAddr", "type": "string" }, { "name": "senderPhone", "type": "string" } ], "name": "sender", "type": "tuple" }, { "components": [ { "name": "receiverName", "type": "string" }, { "name": "receiverAddr", "type": "string" }, { "name": "receiverPhone", "type": "string" } ], "name": "receiver", "type": "tuple" }, { "name": "category", "type": "string" }, { "name": "price", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" } ]');
	
	var contract = web3.eth.contract(abi).at(contractAddr);
	
	var senderName = contract.setInvoice.call(senderName, senderAddr, senderPhone, 
											receiverName, receiverAddr, receiverPhone, 
											category, price);
	

</script>
</body>
</html>