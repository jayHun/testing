<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
  <head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/t10/assets/js/web3.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Center the loader */
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}
</style>
</head>
<body>
<script>
document.getElementById("loader").style.display = "block";
document.getElementById("myDiv").style.display = "none";
</script>
<div id="loader"><p>loading</p></div>

<div style="display:none;" id="myDiv" class="animate-bottom">
  <h1>블록체인에 송장 정보를 기록했습니다!</h1>
  <p>송장 해쉬주소: ${ addr }</p>
  <p>송장 인증키: ${ newPassword }</p>
  <a id="url" href="">인증TEST(QR이미지 나와야함)<img src=""/></a>
</div>
	
	<input type="hidden" id="addr" value="${ addr }"/>
    <input type="hidden" id="password" value="${ newPassword }"/>
    
    <input type="hidden" id="senderName" value="${ senderName }"/>
    <input type="hidden" id="senderAddr" value="${ senderAddr }"/>
    <input type="hidden" id="senderPhone" value="${ senderPhone }"/>
    <input type="hidden" id="receiverName" value="${ receiverName }"/>
    <input type="hidden" id="receiverAddr" value="${ receiverAddr }"/>
    <input type="hidden" id="receiverPhone" value="${ receiverPhone }"/>
    <input type="hidden" id="category" value="${ type }"/>
    <input type="hidden" id="price" value="${ price }"/>
    
    

<script type="text/javascript">
	
	
	/* invoice info */
	var senderName = $('#senderName').val();
	var senderAddr = $('#senderAddr').val();
	var senderPhone = $('#senderPhone').val();
	var receiverName = $('#receiverName').val();
	var receiverAddr = $('#receiverAddr').val();
	var receiverPhone = $('#receiverPhone').val();
	var category = $('#category').val();
	var price = $('#price').val();
	
	/* blockchain 접속 */
	var web3 = new Web3("http://10.64.78.19:8545"); 
	web3.setProvider(new web3.providers.HttpProvider("http://10.64.78.19:8545"));

	/* make invoice hash */
	var password = $('#password').val(); // invoice auth password
	var addr = $('#addr').val();	
	
	$('#url').attr('href', "/t10/auth/authPage?addr=" + addr + "&infoType=DEL");
	$('#addr').text(addr);
	
	console.log("make invoice account: " + addr + '/' + password);
	
	//var addr = $('#addr').val(); // invoice hash
	var coinbase = '0xf9acc6ebb64f842b1af3696c453213096b576c8f'; // coinbase
	console.log("coinbase open: " + web3.personal.unlockAccount(coinbase, "abcd1234"));
	console.log("send ether: " + web3.eth.sendTransaction({from : coinbase, to : addr, value: web3.toWei(100, "ether")}));
	console.log("wait a second...");
	
	setTimeout(function() {
		console.log("invoice open: " + web3.personal.unlockAccount(addr, password)); // invoice open
		
		/* contract instance */
		var contractAddr = "0x88562fb185b7df631116801c46a3b6ff873c8e86";
		var abi = JSON.parse('[ { "constant": false, "inputs": [ { "name": "category", "type": "string" }, { "name": "price", "type": "string" } ], "name": "setInvoice", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [ { "name": "recieverName", "type": "string" }, { "name": "recieverAddr", "type": "string" }, { "name": "recieverPhone", "type": "string" } ], "name": "setReceiver", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [ { "name": "senderName", "type": "string" }, { "name": "senderAddr", "type": "string" }, { "name": "senderPhone", "type": "string" } ], "name": "setSender", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "getCategory", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getPrice", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getReceiverAddr", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getReceiverName", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getReceiverPhone", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getSenderAddr", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getSenderName", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "getSenderPhone", "outputs": [ { "name": "", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [ { "name": "", "type": "address" } ], "name": "InvoiceList", "outputs": [ { "components": [ { "name": "name", "type": "string" }, { "name": "addr", "type": "string" }, { "name": "phone", "type": "string" } ], "name": "sender", "type": "tuple" }, { "components": [ { "name": "name", "type": "string" }, { "name": "addr", "type": "string" }, { "name": "phone", "type": "string" } ], "name": "receiver", "type": "tuple" }, { "name": "category", "type": "string" }, { "name": "price", "type": "string" } ], "payable": false, "stateMutability": "view", "type": "function" } ]');
		var contract = web3.eth.contract(abi).at(contractAddr);
		
		console.log("contract connect: " + contract);
		
		/* contract method */
		var setSender = contract.setSender.sendTransaction(senderName, senderAddr, senderPhone, {from : addr});
		var setReceiver = contract.setReceiver.sendTransaction(receiverName, receiverAddr, receiverPhone, {from : addr});
		var setInvoice = contract.setInvoice.sendTransaction(category, price, {from : addr});
		
		console.log("send invoice complete");
		
		document.getElementById("loader").style.display = "none";
		document.getElementById("myDiv").style.display = "block";
		  
		}, 5000);

	
</script>
  </body>
</html>


