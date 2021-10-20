package web.jsp05.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TestDAO {
	
	//커넥션 메서드 (분리)
	private Connection getConnection() throws Exception{
		//DB 연결
		Context ctx = new InitialContext();	//컨텍스트 객체 생성 (Context 정보 가져오려면)
		Context env = (Context)ctx.lookup("java:comp/env");//자바컨포넌트로 만들어진 환경 설정 찾아오기
		DataSource ds =(DataSource)env.lookup("jdbc/orcl");//그중, jdbc/orcl인 정보 다시 찾아오기
		Connection conn = ds.getConnection();// 커넥션 연결.
		return conn;//Connection 으로 리턴
	}
	
	

	//DB에 test테이블에 존재하는 전체 목록으로 가져오는 메서드
	public List selectAll() {
		List list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			/*
			 * //DB 연결 Context ctx = new InitialContext(); //컨텍스트 객체 생성 (Context 정보 가져오려면)
			 * Context env = (Context)ctx.lookup("java:comp/env");//자바컨포넌트로 만들어진 환경 설정 찾아오기
			 * DataSource ds =(DataSource)env.lookup("jdbc/orcl");//그중, jdbc/orcl인 정보 다시
			 * 찾아오기 conn = ds.getConnection();// 커넥션 연결. 
			 * 따로 빼기
			 */		
			conn = getConnection(); // 위 4줄의 코드를 메서드로 따로 분리해줌.
			//분리한 getConnection() 메서드 호출해서 커넥션만 리턴받아와 변수에 담아주면 끝
			
		//쿼리문 작성, pstmt 객체
		String sql = "select * from test";
		pstmt = conn.prepareStatement("select * from test");
		
		//쿼리 실행
		rs = pstmt.executeQuery();
		list = new ArrayList();// 리스트에 담을 준비
		//rs에 있는 레코드에 수만큼 반복해서 
		while(rs.next()) {
			//한번 반복할때, 하나의 레코드에서 각각 값을 꺼내서 dto생성해 각각 변수에 담고
			TestDTO dto = new TestDTO();
			dto.setId(rs.getString("id"));
			dto.setPw(rs.getString("pw"));
			dto.setAge(rs.getInt("age"));
			dto.setReg(rs.getTimestamp("reg"));
			//dto에 하나의 레코드 정보를 담았으면, list에 추가하기
			list.add(dto);
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!= null) try{rs.close();} catch(Exception e) {e.printStackTrace();}
			if(pstmt!= null) try{pstmt.close();} catch(Exception e) {e.printStackTrace();}
			if(conn!= null) try{conn.close();} catch(Exception e) {e.printStackTrace();}
		
			
		}

		return list;
		
	}
	
	//회원가입 : jsp에서 던져중 id,pw,age 데이터를 받기 위한 매개변수 작성
	public void insert(String id, String pw, int age) {
		//finally 구문에서 변수 close  해주기 위해서 try 전에 미리 변수 = null로 선언만.
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = getConnection();
			
			String sql = "insert into test values(?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.setInt(3,age);
			
			int result = pstmt.executeUpdate();
			System.out.println(result);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(Exception e) {e.printStackTrace();}
			
		}
	}
	
	
	
	
	public void insert2(TestDTO dto) {
		//finally 구문에서 변수 close  해주기 위해서 try 전에 미리 변수 = null로 선언만.
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = getConnection();
			String sql = "insert into test values(?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			pstmt.setInt(3,dto.getAge());
			
			int result = pstmt.executeUpdate();
			System.out.println(result);
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try {pstmt.close();}catch(Exception e) {e.printStackTrace();}
				if(conn != null) try {conn.close();}catch(Exception e) {e.printStackTrace();}
			
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
