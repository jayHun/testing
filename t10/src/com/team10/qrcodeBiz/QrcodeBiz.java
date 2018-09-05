package com.team10.qrcodeBiz;

import java.sql.Connection;
import java.util.ArrayList;

import com.team10.memberEntity.MemberEntity;
import com.team10.qrcodeDao.QrDao;
import com.team10.qrcodeEntity.qrcodeEntity;
import com.team10.util.dbconn;

public class QrcodeBiz {
	public int makeQrcode(String infoType, MemberEntity member) throws Exception {
		Connection conn = null;
		QrDao dao = new QrDao();
		int result = 0;
		
		try {
			conn = dbconn.getConn();
			result = dao.makeQrcode(infoType, member, conn);
			if(result == 1) {
				conn.commit();
			}else {
				conn.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			conn.close();
		}
		return result;
	}
	
	public int makeQrcode(String infoType, MemberEntity member, String addr) throws Exception {
		Connection conn = null;
		QrDao dao = new QrDao();
		int result = 0;
		
		try {
			conn = dbconn.getConn();
			result = dao.makeQrcode(infoType, member, addr, conn);
			if(result == 1) {
				conn.commit();
			}else {
				conn.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			conn.close();
		}
		return result;
	}
	
	
	
	public ArrayList<qrcodeEntity> selectQrCodeList(MemberEntity member) throws Exception {
		Connection conn = null;
		QrDao dao = new QrDao();
		ArrayList<qrcodeEntity> qrcodeList = null;
		
		try {
			conn = dbconn.getConn();
			qrcodeList = dao.selectQrCodeList(member, conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
		}
		
		return qrcodeList;
	}
}