package com.team10.register;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.http.HttpService;

import com.team10.memberEntity.MemberEntity;
import com.team10.util.makeRandom;

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
		
		/* 새로운 주소 생성을 위한 랜덤 비밀번호 생성 */
		String newPassword = makeRandom.make();
		//String newPassword = "abcd1234";
		System.out.println("new password: " + newPassword);

		
		try {
			/* qrcode 제작 */
			//QrcodeBiz biz = new QrcodeBiz();
			
			/* qrcode 저장 */
			//biz.makeQrcode(infoType, member, newAddress);
			
			
			/* smart contract에 setInvoice() */
			
			RequestDispatcher rd = request.getRequestDispatcher("/register/registerAccount.jsp");
			request.setAttribute("newPassword", newPassword);

			request.setAttribute("senderName", senderName);
			request.setAttribute("senderAddr", senderAddr);
			request.setAttribute("senderPhone", senderPhone);
			request.setAttribute("receiverName", receiverName);
			request.setAttribute("receiverAddr", receiverAddr);
			request.setAttribute("receiverPhone", receiverPhone);
			request.setAttribute("type", type);
			request.setAttribute("price", price);
			
			rd.forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
