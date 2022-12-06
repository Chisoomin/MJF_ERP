package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	
	private Connection conn;//데이터베이스에 접근하게 해주는 하나의 객체
	private ResultSet rs;//정보를 담을 수 있는 객체
	
	public BbsDAO() {//mysql에 접속을 하게 해줌,자동으로 데이터베이스 커넥션이 일어남
		try {//예외처리
			String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com:3306/MJFdb";
			String user = "MJFdbRoot";
			String password = "mjfrootpw";
			Class.forName("com.mysql.jdbc.Driver");//mysql드라이버를 찾는다.
			//드라이버는 mysql에 접속할 수 있도록 매개체 역할을 하는 하나의 라이브러리
			conn=DriverManager.getConnection(url,user,password);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int getNext() {
		String sql="select MAX(account_num) from account_table";//마지막 게시물 반환
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public int write(String code, String name, String ceo, String tel, String fax, String email, String postcode, String addr1, String addr2, String website, String remark, String type, String begin_date, String vailable, String type_of_business, String items_of_business, String sales_name, String sales_tel, String sales_email, String bank_name, String account_number, String account_holder) {
		String sql = "insert into account_table (account_num,account_code,account_name,account_ceo,account_tel,account_fax,account_email,account_postcode,account_address,account_address2,account_website,account_remark,account_type,account_begin_date,account_vailable,type_of_business,items_of_business,sales_mgr_name,sales_mgr_mobile,sales_mgr_email,bank_name,bank_account_number,bank_account_holder) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());//게시글 번호
			pstmt.setString(2, code);
			pstmt.setString(3, name);
			pstmt.setString(4, ceo);
			pstmt.setString(5, tel);
			pstmt.setString(6, fax);
			pstmt.setString(7, email);
			pstmt.setString(8, postcode);
			pstmt.setString(9, addr1);
			pstmt.setString(10, addr2);
			pstmt.setString(11, website);
			pstmt.setString(12, remark);
			pstmt.setString(13, type);
			pstmt.setString(14, begin_date);
			pstmt.setString(15, vailable);
			pstmt.setString(16, type_of_business);
			pstmt.setString(17, items_of_business);
			pstmt.setString(18, sales_name);
			pstmt.setString(19, sales_tel);
			pstmt.setString(20, sales_email);
			pstmt.setString(21, bank_name);
			pstmt.setString(22, account_number);
			pstmt.setString(23, account_holder);
			
			return pstmt.executeUpdate();	
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return -1;//데이터베이스 오류
	}
	
	//데이터베이스에서 글의 목록을 가져오는 소스코드 작성
	public ArrayList<Bbs> getList(int pageNumber){//특정한 리스트를 받아서 반환
		String sql="SELECT * from account_table where account_num < ? order by account_num desc limit 10";//마지막 게시물 반환, 삭제가 되지 않은 글만 가져온다.
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);//물음표에 들어갈 내용
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setnum(rs.getString(1));
				bbs.setbegin_date(rs.getString(14));
				bbs.setcode(rs.getString(2));
				bbs.setname(rs.getString(3));
				bbs.setceo(rs.getString(4));
				bbs.settype(rs.getString(13));
				bbs.settype_of_business(rs.getString(16));
				bbs.settel(rs.getString(5));
				bbs.setvailable(rs.getString(15));
				list.add(bbs);//list에 해당 인스턴스를 담는다.
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;//게시글 리스트 반환
	}
	
	public int getCount() {
		String sql = "select count(*) from account_table";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public boolean nextPage(int pageNumber) {//페이지 처리를 위한 함수
		String sql="SELECT * from account_table where account_num < ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;//다음 페이지로 넘어갈 수 있음
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Bbs> getSearch(String searchField, String searchText, int pageNumber){//특정한 리스트를 받아서 반환
	      ArrayList<Bbs> list = new ArrayList<Bbs>();
	      String sql ="select * from account_table WHERE "+searchField.trim();
	      try {
	    	  	if(searchField.equals("1")) {
	    	  		sql="SELECT * from account_table where account_num < ? order by account_num desc limit 10";
	    			PreparedStatement pstmt=conn.prepareStatement(sql);
	    			pstmt.setInt(1, getNext()-(pageNumber-1)*10);//물음표에 들어갈 내용
	    			rs=pstmt.executeQuery();
	    	  	}
	    	    else if(searchText != null && !searchText.equals("")){//이거 빼면 안 나온다ㅜ 왜지?
	                sql +=" LIKE '%"+searchText.trim()+"%' and account_num < ? order by account_num desc limit 10";
	                PreparedStatement pstmt=conn.prepareStatement(sql);
	                pstmt.setInt(1, getNext()-(pageNumber-1)*10);
	                rs=pstmt.executeQuery();//select
	            }
	         while(rs.next()) {
	        	 Bbs bbs = new Bbs();
					bbs.setnum(rs.getString(1));
					bbs.setbegin_date(rs.getString(14));
					bbs.setcode(rs.getString(2));
					bbs.setname(rs.getString(3));
					bbs.setceo(rs.getString(4));
					bbs.settype(rs.getString(13));
					bbs.settype_of_business(rs.getString(16));
					bbs.settel(rs.getString(5));
					bbs.setvailable(rs.getString(15));
					list.add(bbs);//list에 해당 인스턴스를 담는다.
	         }         
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list;//ㄱㅔ시글 리스트 반환
	   }
}