package com.team10.memberCmd;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team10.memberBiz.MemberBiz;
import com.team10.memberEntity.MemberEntity;
import com.team10.qrcodeBiz.QrcodeBiz;
import com.team10.qrcodeEntity.qrcodeEntity;


@WebServlet(urlPatterns = { "/com/LoginMember" })
public class LoginMember extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public LoginMember() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String inputEmail = request.getParameter("inputEmail");
		String inputPassword = request.getParameter("inputPassword");
		
		// 로그인 시에 사용자가 가지는 qrcodeEntity를 타입에 따라 화면(모달)에 뿌려줘야함
		ArrayList<qrcodeEntity> qrcodeList = null;
		MemberBiz mbiz = new MemberBiz();
		QrcodeBiz qbiz = new QrcodeBiz();
		
		try {
			MemberEntity member = mbiz.loginMember(inputEmail, inputPassword);
			
			if (member != null) {
				qrcodeList = qbiz.selectQrCodeList(member);
				
				session.setAttribute("memberInfo", member);
				session.setAttribute("qrcodeList", qrcodeList);
				response.sendRedirect("/t10/index.jsp");

			} else {

				throw new Exception();

			}

		} catch (Exception e) {

			e.printStackTrace();

			RequestDispatcher rd = request
					.getRequestDispatcher("/common/message.jsp");
			request.setAttribute("message", "[ERROR] 로그인 중 예상치 못한 문제가 발생하였습니다.");
			rd.forward(request, response);

		}

	}

}
