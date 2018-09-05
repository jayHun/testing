package com.team10.memberBiz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.team10.memberDao.MemberDao;
import com.team10.memberEntity.MemberEntity;
import com.team10.qrcodeEntity.qrcodeEntity;
import com.team10.util.dbconn;

public class MemberBiz {

	public MemberEntity loginMember(String memberId, String memberPw) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		MemberDao dao = new MemberDao();

		MemberEntity member = null;

		try {

			conn = dbconn.getConn();
			member = dao.loginMember(memberId, memberPw, conn);

		} catch (SQLException e) {

			throw new SQLException();

		} finally {

			conn.close();

		}

		return member;
	}

	public int insertMember(MemberEntity member) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		MemberDao dao = new MemberDao();

		int result = 0;

		try {

			conn = dbconn.getConn();
			result = dao.insertMember(member, conn);

			if (result == 1) {

				conn.commit();

			} else {

				conn.rollback();
			}

		} catch (SQLException e) {

			conn.rollback();

			throw new SQLException();

		} finally {

			conn.close();

		}

		return result;

	}

	
	 public int updateMember(MemberEntity member) throws SQLException, ClassNotFoundException{
		 	Connection conn = null;
		 	MemberDao dao = new MemberDao();


	        int result = 0;
	        
	        try {
	    		
	        	conn = dbconn.getConn();
	        	result = dao.updateMember( member, conn );
	        	
	            if(result == 1){
	            	
	            	conn.commit();
	            	
	            } else {
	            	
	            	conn.rollback();
	            }
	            
	        } catch ( SQLException e ) {
	        	
	        	conn.rollback();
	            throw new SQLException();
	            
	        } finally {
	        	
	        	conn.close();
	            
	        }
	        
	        return result;
	        
	    }
	  
	  public int deleteMember(String id, String pw) throws SQLException, ClassNotFoundException{
		 	Connection conn = null;
		 	MemberDao dao = new MemberDao();

	    	

	        int result = 0;
	        
	        try {
	        	conn = dbconn.getConn();
	        	result = dao.deleteMember(id, pw , conn );    	
	            if(result == 1){
	            	conn.commit();
	            } else {
	            	conn.rollback();
	            }	            
	        } catch ( SQLException e ) {
	        	conn.rollback();
	            throw new SQLException();	            
	        } finally {
	        	conn.close();
	        }
	        
	        return result;
	        
	   }
	
	public MemberEntity findMemberByEmail(String email) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		MemberDao dao = new MemberDao();

		MemberEntity member = null;

		try {

			conn = dbconn.getConn();
			member = dao.findMemberByEmail(email, conn);

		} catch (SQLException e) {

			throw new SQLException();

		} finally {

			conn.close();

		}

		return member;
	}
	
}
