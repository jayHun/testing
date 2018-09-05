package com.team10.qrcodeCmd;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team10.memberBiz.MemberBiz;
import com.team10.memberEntity.MemberEntity;
import com.team10.qrcodeBiz.QrcodeBiz;


@WebServlet("/com/QrMake")
public class QrMake extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QrMake() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String infoType = request.getParameter("infoType");
		String memberEmail = request.getParameter("memberEmail");
		
		MemberBiz mbiz = new MemberBiz();
		QrcodeBiz qbiz = new QrcodeBiz();
		
		MemberEntity member = null;
		int result = 0;
		
		try {
			member = mbiz.findMemberByEmail(memberEmail);
			
			if(member != null){
				
				result = qbiz.makeQrcode(infoType, member);
				
				if(result == 1) {
					request.setAttribute("memberEmail", member.getMemberEmail());
					RequestDispatcher req = request.getRequestDispatcher("/com/QrList");
					req.forward(request, response);
				}else {
					response.sendRedirect("/t10/common/message.jsp");
				}

			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
