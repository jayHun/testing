package com.team10.register;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.core.methods.response.Web3ClientVersion;
import org.web3j.protocol.http.HttpService;

import com.team10.memberEntity.MemberEntity;
import com.team10.qrcodeBiz.QrcodeBiz;

/**
 * Servlet implementation class registerAccount
 */
@WebServlet("/register/registerAccount")
public class registerAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberEntity member = (MemberEntity)session.getAttribute("memberInfo");
		
		String senderName = request.getParameter("senderName");
		String senderAddr = request.getParameter("senderAddr");
		String senderPhone = request.getParameter("senderPhone");
		String receiverName = request.getParameter("receiverName");
		String receiverAddr = request.getParameter("receiverAddr");
		String receiverPhone = request.getParameter("receiverPhone");
		String type = request.getParameter("type");
		String price = request.getParameter("price");
		
		/* 货肺款 林家 积己阑 困茄 罚待 厚剐锅龋 积己 */
		//String newPassword = makeRandom.make();
		String newPassword = "abcd1234";
		System.out.println("new password: " + newPassword);

		
		Web3j web3 = Web3j.build(new HttpService("http://10.64.78.19:8545"));
		Admin admin = Admin.build(new HttpService("http://10.64.78.19:8545"));
		try {
			/* web3 立加 & 沥焊 犬牢 */
			Web3ClientVersion web3ClientVersion = web3.web3ClientVersion().send();
			String clientVersion = web3ClientVersion.getWeb3ClientVersion();
			
			/* 林家 积己阑 困茄 admin 立加 */
			String newAddress = admin.personalNewAccount(newPassword).send().getResult();
			String infoType = "DEL";
			
			System.out.println(newAddress);
			
			/* qrcode 力累 */
			//QrcodeBiz biz = new QrcodeBiz();
			
			/* qrcode 历厘 */
			//biz.makeQrcode(infoType, member, newAddress);
			
			
			/* smart contract俊 setInvoice() */
			
			RequestDispatcher rd = request.getRequestDispatcher("/register/registerAccount.jsp");
			request.setAttribute("newPassword", newPassword);
			request.setAttribute("newAddress", newAddress);

			request.setAttribute("senderName", "cha");
			request.setAttribute("senderAddr", "cc");
			request.setAttribute("senderPhone", "010");
			request.setAttribute("receiverName", "han");
			request.setAttribute("receiverAddr", "dd");
			request.setAttribute("receiverPhone", "012");
			request.setAttribute("type", "ah");
			request.setAttribute("price", "0001");
			
			rd.forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			web3.shutdown();
			admin.shutdown();
		}
	}
}
