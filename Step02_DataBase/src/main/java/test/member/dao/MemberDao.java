package test.member.dao;
/*
 * Application 전역에서 MemberDao 객체는 오직 한개만 생성해서 사용하도록 구조를 만들어야 한다.
 * 
 * 1. 외부에서 객체 생성하지 못하도록 생성자의 접근 지정자는 private
 * 2. 자신의 참조값을 저장할 수 있는 static 필드 만들기
 * 3. 자신의 참조값을 리턴해주는 public 메소드 만들기
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//2.
	private static MemberDao dao;
	
	//1.
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		//서버 시작 후 최초 요청이라면
		if(MemberDao.dao==null) {
			//객체를 생성해서 static 필드에 저장해 놓는다.
			MemberDao.dao=new MemberDao();
		}
		//필드에 저장된 참조값 리턴해주기
		return dao;
	}
	
	//회원 한명의 정보를 수정하는 메소드
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE member"
					+ " SET name=?, addr=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			//sql문을 수행하고 변화된(추가, 수정, 삭제된) row의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row의 갯수가 0보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//회원 한명의 정보를 리턴하는 메소드
	public MemberDto getData(int num) {
		MemberDto dto = null;
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT name, addr"
					+ " FROM member"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			//sql문을 수행하고 변화된(추가, 수정, 삭제된) row의 갯수 리턴 받기
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null) 
					conn.close();
				} catch (Exception e) {
				}
			}
			return dto;
		}
	
	public boolean delete(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM member"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			//sql문을 수행하고 변화된(추가, 수정, 삭제된) row의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt!=null)pstmt.close();
				if (conn!=null)conn.close();
			} catch (Exception e) {}
		}
		//만일 변화된 row의 갯수가 0보다 크면 작업 성공
		if(rowCount>0) {
			return true;
		} else {
			return false;
		}
	}
	
	//회원 한명의 정보를 추가하는 메소드
	public boolean insert(MemberDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES(member_seq.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			//sql문을 수행하고 변화된(추가, 수정, 삭제된) row의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt!=null)pstmt.close();
				if (conn!=null)conn.close();
			} catch (Exception e) {}
		}
		//만일 변화된 row의 갯수가 0보다 크면 작업 성공
		if(rowCount>0) {
			return true;
		} else {
			return false;
		}
	}
	
	//회원 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		//회원 목록을 담을 객체 미리 생성하기
		List<MemberDto> list = new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다.(Connection Pool에서 얻어오기)
			conn = new DbcpBean().getConn();
			//실행할 sql문
			String sql = "SELECT num, name, addr"
					+ " FROM member"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성

			//select문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				//ResultSet에 cursor가 위치한 곳의 칼럼 정보를 얻어와서 MemberDto 객체에 담고
				MemberDto dto = new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//ArrayList 객체에 누적시키기
				list.add(dto);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection이 Connection Pool에 반납된다.
			} catch (Exception e) {
			}
		}
		//회원목록이 담긴 ArrayList 객체 리턴해주기
		return list;
	}
}
