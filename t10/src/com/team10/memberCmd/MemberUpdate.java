package com.team10.memberCmd;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team10.memberBiz.MemberBiz;
import com.team10.memberEntity.MemberEntity;

/**
 * Servlet implementation class memberRegister
 */
@WebServlet({ "/memberUpdate", "/com/MemberUpdate" })
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate() {
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

		
		String inputEmail = request.getParameter("inputEmailChange");
		String inputPassword = request.getParameter("inputPasswordChange");
		String inputName = request.getParameter("inputNameChange");
		String userType = request.getParameter("userTypeChange");
		String inputNumber = request.getParameter("inputNumberChange");
		String flag = request.getParameter("flag"); // update, delete
		
		

		System.out.println("업뎃전 : " + inputName);
		System.out.println(flag);
		
		if(flag.equals("update")){		
		
			System.out.println(flag);
			
			MemberEntity member = new MemberEntity();

			member.setMemberEmail(inputEmail);
			member.setMemberPw(inputPassword);
			member.setMemberName(inputName);
			member.setMemberPhone(inputNumber);
			member.setMemberType(userType);

			try {

				MemberBiz biz = new MemberBiz();
				
				
				
				System.out.println(inputName);
				System.out.println(userType);
				System.out.println(inputNumber);
				
				
				
				biz.updateMember(member);

				HttpSession session = request.getSession();
				
				if (session != null) {
					session.invalidate();
				}

				response.sendRedirect("/t10/index.jsp");
			

			} catch (Exception e) {
				
				e.printStackTrace();
				
				RequestDispatcher rd = request.getRequestDispatcher("/common/message.jsp");
				request.setAttribute("message",	"[ERROR] 회원가입 중 예상치 못한 문제가 발생하였습니다.");
				rd.forward(request, response);

			}
			
		} else if(flag.equals("delete")) {
		
				System.out.println(inputEmail);
				System.out.println(inputPassword);

			try {

				HttpSession session = request.getSession();
				
				MemberBiz biz = new MemberBiz();			
				biz.deleteMember(inputEmail, inputPassword);
				
				if (session != null) {
					session.invalidate();
				}

				response.sendRedirect("/t10/index.jsp");
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
				RequestDispatcher rd = request.getRequestDispatcher("/common/message.jsp");
				request.setAttribute("message",	"[ERROR] 회원가입 중 예상치 못한 문제가 발생하였습니다.");
				rd.forward(request, response);

			}
		
			
		}
		
	
	}

}
