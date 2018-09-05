package com.team10.qrcodeDao;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.team10.memberEntity.MemberEntity;
import com.team10.qrcodeEntity.qrcodeEntity;

public class QrDao {
	public void makeQrcode(String url, String infoType, MemberEntity member) throws WriterException, IOException {

		// 이미지 파일이 저장될 경로 설정
		File path = new File("C:\\Users\\81547\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\t10\\qrcode");
		
		// 파일 이름 설정
		
		String savedFileName = "";
		savedFileName = member.getMemberWallet() + "_" + infoType; // UUID.randomUUID().toString().replace("-", ""); >> 랜덤아이디 설정
		savedFileName = new String(savedFileName.getBytes("UTF-8"), "ISO-8859-1");
		
		if (!path.exists()) {
			path.mkdirs();
		}

		// QRCode 생성
		QRCodeWriter writer = new QRCodeWriter();
		BitMatrix qrCode = writer.encode(url, BarcodeFormat.QR_CODE, 200, 200);

		BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
		ImageIO.write(qrImage, "PNG", new File(path, savedFileName + ".png"));
	}

	public int makeQrcode(String infoType, MemberEntity member, Connection conn) throws Exception {
		String url = "";
		if (infoType.equals("PRI")) {
			url = "localhost:8080/t10/com/priQrcodeShow?addr=" + member.getMemberWallet() + "&infoType=" + infoType;
		} else if (infoType.equals("MED")) {
			url = "localhost:8080/t10/com/medQrcodeShow?addr=" + member.getMemberWallet() + "&infoType=" + infoType;
		} else if (infoType.equals("DEL")) {
			url = "localhost:8080/t10/com/delQrcodeShow?addr=" + member.getMemberWallet() + "&infoType=" + infoType;
		}
		
		// 이미지 로컬 파일에 저장
		try {
			makeQrcode(url, infoType, member);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		String sql = "insert into tb_qrcode values(?, ?, ?)";
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, url);
			pstmt.setString(2, member.getMemberEmail());
			pstmt.setString(3, member.getMemberWallet()  + "_" + infoType + ".png");
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			pstmt.close();
		}

		return result;
	}
	
	
	
	public void makeQrcode(String url, String infoType, MemberEntity member, String addr) throws WriterException, IOException {

		// 이미지 파일이 저장될 경로 설정
		File path = new File("C:\\Users\\81547\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\t10\\qrcode");
		
		// 파일 이름 설정
		
		String savedFileName = "";
		savedFileName = addr + "_" + infoType; // UUID.randomUUID().toString().replace("-", ""); >> 랜덤아이디 설정
		savedFileName = new String(savedFileName.getBytes("UTF-8"), "ISO-8859-1");
		
		if (!path.exists()) {
			path.mkdirs();
		}

		// QRCode 생성
		QRCodeWriter writer = new QRCodeWriter();
		BitMatrix qrCode = writer.encode(url, BarcodeFormat.QR_CODE, 200, 200);

		BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
		ImageIO.write(qrImage, "PNG", new File(path, savedFileName + ".png"));
	}

	public int makeQrcode(String infoType, MemberEntity member, String addr, Connection conn) throws Exception {
		String url = "";
		if (infoType.equals("PRI")) {
			url = "localhost:8080/t10/com/priQrcodeShow?addr=" + addr + "&infoType=" + infoType;
		} else if (infoType.equals("MED")) {
			url = "localhost:8080/t10/com/medQrcodeShow?addr=" + addr + "&infoType=" + infoType;
		} else if (infoType.equals("DEL")) {
			url = "localhost:8080/t10/com/delQrcodeShow?addr=" + addr + "&infoType=" + infoType;
		}
		
		// 이미지 로컬 파일에 저장
		try {
			makeQrcode(url, infoType, member, addr);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		String sql = "insert into tb_qrcode values(?, ?, ?)";
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, url);
			pstmt.setString(2, member.getMemberEmail());
			pstmt.setString(3, addr  + "_" + infoType + ".png");
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			pstmt.close();
		}

		return result;
	}

	
	
	
	
	


	public ArrayList<qrcodeEntity> selectQrCodeList(MemberEntity member, Connection conn) throws SQLException {
		String sql = "select qrcode_url, "
				+ "member_email, "
				+ "img_file_name, "
				+ "substr(qrcode_url, -3, 3) qrcode_type " 
				+ "from tb_qrcode "
				+ "where member_email='" + member.getMemberEmail() + "'";
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<qrcodeEntity> qrcodeList = null;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			qrcodeList = new ArrayList<>();
			
			while(rset.next()) {
				qrcodeEntity qrcode = new qrcodeEntity();
				qrcode.setQrcodeUrl(rset.getString(1));
				qrcode.setMemberEmail(rset.getString(2));
				qrcode.setImgFileName(rset.getString(3));
				qrcode.setQrcodeType(rset.getString(4));
				qrcodeList.add(qrcode);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			rset.close();
			stmt.close();
		}
		
		return qrcodeList;
	}
}