package com.team10.memberDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.team10.memberEntity.MemberEntity;

public class MemberDao {
	public MemberEntity loginMember(String memberId, String memberPw, Connection conn) throws SQLException {

		PreparedStatement stmt = null;
		ResultSet rset = null;

		String sql = " SELECT " + " MEMBER_EMAIL, " + " MEMBER_PW, " + " MEMBER_NAME, " + " MEMBER_PHONE, "
				+ " MEMBER_TYPE, " + " MEMBER_WALLET " + " FROM tb_member " + " WHERE MEMBER_EMAIL = ? "
				+ " AND MEMBER_PW = ? ";

		ArrayList<MemberEntity> members = new ArrayList<MemberEntity>();

		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, memberId);
			stmt.setString(2, memberPw);

			rset = stmt.executeQuery();

			while (rset.next()) {

				MemberEntity member = new MemberEntity();

				member.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				member.setMemberPw(rset.getString("MEMBER_PW"));
				member.setMemberName(rset.getString("MEMBER_NAME"));
				member.setMemberPhone(rset.getString("MEMBER_PHONE"));
				member.setMemberType(rset.getString("MEMBER_TYPE"));
				member.setMemberWallet(rset.getString("MEMBER_WALLET"));

				members.add(member);
			}

		} catch (SQLException e) {

			e.printStackTrace();
			throw new SQLException();

		} finally {

			rset.close();
			stmt.close();

		}

		if (members.size() == 1) {

			return members.get(0);

		} else {

			return null;

		}

	}

	public int insertMember(MemberEntity member, Connection conn) throws SQLException {

		PreparedStatement stmt = null;

		String sql = "INSERT INTO tb_MEMBER VALUES ( ?, ?, ?, ?, ?, ?)";

		int result = 0;

		try {

			stmt = conn.prepareStatement(sql);

			stmt.setString(1, member.getMemberEmail());
			stmt.setString(2, member.getMemberPw());
			stmt.setString(3, member.getMemberName());
			stmt.setString(4, member.getMemberPhone());
			stmt.setString(5, member.getMemberType());
			stmt.setString(6, member.getMemberWallet());

			result = stmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			throw new SQLException();
		} finally {

			stmt.close();

		}

		return result;

	}
	
	public int deleteMember(String id, String pw, Connection conn)
			throws SQLException {

		PreparedStatement stmt = null;
		
		String sql = "DELETE FROM tb_member"
				+ " WHERE member_email = ?"
				+ "	AND MEMBER_PW = ?" ;
	
		int result = 0;

		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			result = stmt.executeUpdate();
		
		} catch (SQLException e) {

			e.printStackTrace();
			throw new SQLException();			
		} finally {
			
			stmt.close();
			
		}
		
		return result;
		
	}
	
	
	public int updateMember(MemberEntity member, Connection conn)
			throws SQLException {

		PreparedStatement stmt = null;
		
		String sql = "update tb_member"
				+ " Set MEMBER_PW = ?, MEMBER_NAME = ?, "
				+ " MEMBER_PHONE = ?, MEMBER_TYPE = ?"
				+ " WHERE MEMBER_EMAIL = ?";
	
		int result = 0;

		try {
			
			stmt = conn.prepareStatement(sql);
		
			stmt.setString(1, member.getMemberPw());
			stmt.setString(2, member.getMemberName());
			stmt.setString(3, member.getMemberPhone());
			stmt.setString(4, member.getMemberType());
			stmt.setString(5, member.getMemberEmail());
			
			result = stmt.executeUpdate();
		
		} catch (SQLException e) {

			e.printStackTrace();
			throw new SQLException();			
		} finally {
			
			stmt.close();
			
		}
		
		return result;
		
	}
	
	public MemberEntity findMemberByEmail(String email, Connection conn) throws SQLException {

		PreparedStatement stmt = null;
		ResultSet rset = null;
		MemberEntity member = null;

		String sql = " SELECT " + " MEMBER_EMAIL, " + " MEMBER_PW, " + " MEMBER_NAME, " + " MEMBER_PHONE, "
				+ " MEMBER_TYPE, " + " MEMBER_WALLET " + " FROM tb_member " + " WHERE MEMBER_EMAIL = ? ";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			rset = stmt.executeQuery();

			while (rset.next()) {

				member = new MemberEntity();

				member.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				member.setMemberPw(rset.getString("MEMBER_PW"));
				member.setMemberName(rset.getString("MEMBER_NAME"));
				member.setMemberPhone(rset.getString("MEMBER_PHONE"));
				member.setMemberType(rset.getString("MEMBER_TYPE"));
				member.setMemberWallet(rset.getString("MEMBER_WALLET"));

			}

		} catch (SQLException e) {

			e.printStackTrace();
			throw new SQLException();

		} finally {

			rset.close();
			stmt.close();

		}

		return member;
	}
}
