package com.team10.qrcodeCmd;

import java.io.IOException;
import java.util.ArrayList;

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


@WebServlet("/com/QrList")
public class QrList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public QrList() {
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
		
		HttpSession session = request.getSession();
		
		String memberEmail = request.getParameter("memberEmail");
		
		MemberBiz mbiz = new MemberBiz();
		QrcodeBiz qbiz = new QrcodeBiz();
		
		MemberEntity member = null;
		ArrayList<qrcodeEntity> qrcodeList = null;
		
		try {
			member = mbiz.findMemberByEmail(memberEmail);
			if(member != null) {
				qrcodeList = qbiz.selectQrCodeList(member);
				if(qrcodeList != null && qrcodeList.size() != 0) {
					session.setAttribute("qrcodeList", qrcodeList);
					response.sendRedirect("/t10/index.jsp");
				}
			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/t10/common/message.jsp");
		}
	}
}
