package com.team10.memberCmd;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.http.HttpService;

import com.team10.memberBiz.MemberBiz;
import com.team10.memberEntity.MemberEntity;

/**
 * Servlet implementation class memberRegister
 */
@WebServlet({ "/memberRegister", "/com/MemberRegister" })
public class MemberRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		request.setCharacterEncoding("UTF-8");

		String inputEmail = request.getParameter("inputEmailregister");
		String inputPassword = request.getParameter("inputPasswordregister");
		String inputName = request.getParameter("inputName");
		String userType = request.getParameter("userType");
		String inputNumber = request.getParameter("inputNumber");
		
		// 해쉬코드 받아오기
		Admin admin = Admin.build(new HttpService(""));
		String newAddress = admin.personalNewAccount(inputPassword).send().getResult();
		String hashCode = newAddress;

		MemberEntity member = new MemberEntity();

		member.setMemberEmail(inputEmail);
		member.setMemberPw(inputPassword);
		member.setMemberName(inputName);
		member.setMemberPhone(inputNumber);
		member.setMemberType(userType);
		member.setMemberWallet(hashCode);

		int result = 0;

		try {

			MemberBiz biz = new MemberBiz();
			
			result = biz.insertMember(member);

			if (result != 0) {

				
				response.sendRedirect("/t10/index.jsp");
				

			} else {
				
				throw new Exception();
				
			}

		} catch (Exception e) {
			
			e.printStackTrace();
			
			RequestDispatcher rd = request.getRequestDispatcher("/common/message.jsp");
			request.setAttribute("message",	"[ERROR] 회원가입 중 예상치 못한 문제가 발생하였습니다.");
			rd.forward(request, response);

		}
	
	
	
	}

}
