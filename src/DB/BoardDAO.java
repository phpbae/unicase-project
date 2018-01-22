package DB;

import bean.BoardBean;
import bean.RqaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BoardDAO {
   // 전달 받은 게시글 정보를 데이터 베이스에 저장한다.
   // [ 파라미터 ]
   // 저장할 게시글 정보가 들어 있는 빈 객체
   
   public static void add_board_content(BoardBean bean)
                              throws Exception {
      // import java.sql
      Connection conn = DBConnector.getConnection();
      
      String sql = "insert into QA_TABLE "
               + "(QA_NUM, QA_TITLE, "
               + "QA_CONTENT, QA_REF_FILE, USER_ID, QA_REGDATE, QA_CNT) values "
               + "(QA_sequence.nextval, ?, ?, ?, ?, SYSDATE, 0)";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, bean.getQa_title());
      pstmt.setString(2, bean.getQa_content());
      pstmt.setString(3, bean.getQa_ref_file());
      pstmt.setString(4, bean.getUser_id());
      
      pstmt.execute();
      
      conn.close();
   }
   // 글 번호 중에 가장 큰값을 반환하는 메서드
   // [리턴]
   // 정수 : 가장 큰 글의 번호
   public static int get_max_idx() throws Exception {
      Connection conn = DBConnector.getConnection();
      
      String sql = "select max(QA_NUM) from QA_TABLE";
      // import java.sql
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(sql);
      rs.next();
      
      int max = rs.getInt(1);
      
      conn.close();
      
      return max;
   }
   // 글 정보를 반화는 메서드
   // [ 파라미터 ]
   // board_idx : 글의 인덱스 번호
   // [ 리턴 ]
   // 글 데이터 담겨져 있는 빈 객체를 반환 
   public static BoardBean get_board_data(int qa_num)
               throws Exception {
      Connection conn = DBConnector.getConnection();
      
      String sql = "select f1.QA_NUM, f1.QA_TITLE, "
               + "f1.QA_CONTENT, f1.QA_REF_FILE, f2.USER_NAME, f2.USER_ID "
               + "from "
               + "QA_TABLE f1, MEMBER_TABLE f2 "
               + "where f1.user_id = f2.user_id and f1.QA_NUM=?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, qa_num);
      
      ResultSet rs = pstmt.executeQuery();
      rs.next();
      
      BoardBean bean = new BoardBean();
      bean.setQa_num(rs.getInt("QA_NUM"));
      bean.setQa_title(rs.getString("QA_TITLE"));
      bean.setQa_content(rs.getString("QA_CONTENT"));
      bean.setQa_ref_file(rs.getString("QA_REF_FILE"));
      bean.setUser_name(rs.getString("USER_NAME"));
      bean.setUser_id(rs.getString("USER_ID"));
      
      conn.close();
      
      return bean;
   }
   // 글 정보 전체를 가져오는 메서드
   // [파라미터]
   // page_num : 페이지 번호
   // [리턴]
   // 해당 페이지에 보여줄 글의 정보를 가지고 있는 컬렉션
   public static ArrayList<BoardBean> 
         get_board_all(int page_num) throws Exception {
      
      Connection conn = DBConnector.getConnection();
      
      String sql = "select * from "
             + "(select rownum as rnum, a1.* from "
             + "(select (select count(*) from RQA_TABLE where QA_NUM=f1.QA_NUM) as RQA_CNT, f1.QA_NUM, f1.QA_TITLE, f1.QA_CNT, f1.USER_ID, f2.USER_NAME from QA_TABLE f1, MEMBER_TABLE f2 where f1.USER_ID=f2.USER_ID " 
             + "order by f1.QA_NUM desc) a1) a2 " 
             + "where a2.rnum >= ? and a2.rnum <= ?";
      
      int min = 1 + ((page_num - 1) * 5);
      int max = min + (5 - 1);
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, min);
      pstmt.setInt(2, max);
      
      ResultSet rs = pstmt.executeQuery();
      // 데이터 담을 컬렉션
      ArrayList<BoardBean> list = new ArrayList<BoardBean>();
      // 데이터의 개수만큼 반복
      while(rs.next()){
         int qa_num = rs.getInt("QA_NUM");
         String qa_title = rs.getString("QA_TITLE");
         String user_name = rs.getString("USER_NAME");
         int qa_cnt = rs.getInt("QA_CNT");
         int rqa_cnt = rs.getInt("RQA_CNT");
         // 빈 객체에 담는다.
         BoardBean sub = new BoardBean();
         sub.setQa_num(qa_num);
         sub.setQa_title(qa_title);
         sub.setUser_name(user_name);
         sub.setQa_cnt(qa_cnt);
         sub.setRqa_cnt(rqa_cnt);
         // 컬렉션에 담아준다.
         list.add(sub);
      }
      
      
      conn.close();
      
      return list;
      
   }
   // 페이지의 개수를 반환하는 메서드
   // [리턴]
   // 정수 : 페이지의 개수
   public static int get_page_cnt() throws Exception{
      Connection conn = DBConnector.getConnection();
      
      String sql = "select count(*) from QA_TABLE";
      
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(sql);
      rs.next();
      
      int cnt_temp = rs.getInt(1);
      // 페이지 개수를 계산
      int cnt = cnt_temp / 5;
      
      if(cnt_temp % 5 > 0){
         cnt++;
      }
      
      conn.close();
      
      return cnt;
   }
   
   // 내가쓴글 페이지의 개수를 반환하는 메서드
   // [리턴]
   // 정수 : 페이지의 개수
   public static int get_my_write_page_cnt(String user_id) throws Exception{
      Connection conn = DBConnector.getConnection();
      
      String sql = "select count(*) from QA_TABLE where USER_ID=?";
      
      PreparedStatement pstmt
                        = conn.prepareStatement(sql);
      pstmt.setString(1, user_id);
      ResultSet rs = pstmt.executeQuery();
      rs.next();
      
      int cnt_temp = rs.getInt(1);
      // 페이지 개수를 계산
      int cnt = cnt_temp / 5;
      
      if(cnt_temp % 5 > 0){
         cnt++;
      }
      
      conn.close();
      
      return cnt;
   }
   
   // 글을 삭제하는 메서드
   public static void delete_content(int qa_num)
                           throws Exception{
      Connection conn = DBConnector.getConnection();
      
      // 쿼리문
      String sql = "delete from QA_TABLE "
               + "where qa_num=?";
      PreparedStatement pstmt 
                  = conn.prepareStatement(sql);
      pstmt.setInt(1, qa_num);
      
      pstmt.execute();
      
      conn.close();
   }
   // 글을 수정하는 메서드
   public static void modify_content(BoardBean bean)
                  throws Exception {
      Connection conn = DBConnector.getConnection();
      System.out.println(bean.getQa_title());
      String sql = "update QA_TABLE "
               + "set QA_TITLE=?, "
               + "QA_CONTENT=?, "
               + "QA_REF_FILE=? "
               + "where QA_NUM=?";
      PreparedStatement pstmt
                  = conn.prepareStatement(sql);
      pstmt.setString(1, bean.getQa_title());
      pstmt.setString(2, bean.getQa_content());
      pstmt.setString(3, bean.getQa_ref_file());
      pstmt.setInt(4, bean.getQa_num());
      
      pstmt.execute();
      
      conn.close();
   }
   
   // 글을 수정하는 메서드
   public static void modify_content2(BoardBean bean)
                  throws Exception {
      
      System.out.println("글을 수정하는 메서드 2");
      Connection conn = DBConnector.getConnection();
      System.out.println(bean.getQa_title());
      String sql = "update QA_TABLE "
               + "set QA_TITLE=?, "
               + "QA_CONTENT=? "
               + "where QA_NUM=?";
      PreparedStatement pstmt
                  = conn.prepareStatement(sql);
      pstmt.setString(1, bean.getQa_title());
      pstmt.setString(2, bean.getQa_content());
      pstmt.setInt(3, bean.getQa_num());
      
      pstmt.execute();
      
      conn.close();
   }
   
   //조회수를 증가시키는 메서드
   public static void update_qa_cnt(int qa_num) throws Exception{
      Connection conn = DBConnector.getConnection();
      
      System.out.println(qa_num);
      String sql = "update qa_table "
               + "set qa_cnt=( "
               + "(select qa_cnt "
               + "from qa_table "
               + "where qa_num=?)+1) "
               + "where qa_num=?";
      
      PreparedStatement pstmt =  conn.prepareStatement(sql);
      pstmt.setInt(1, qa_num);
      pstmt.setInt(2, qa_num);
      
      pstmt.execute();
      
      conn.close();
   }
   //댓글 추가하는 메서드
   public static void add_reply(RqaBean bean) throws Exception{
      Connection conn = DBConnector.getConnection();
      
      String sql = "insert into RQA_TABLE "
               + "(RQA_NUM, RQA_CONTENT, "
               + "USER_ID, QA_NUM, RQA_REGDATE) values "
               + "(REPLY_SEQ.nextval,?,?,?,SYSDATE)";
      PreparedStatement pstmt
                  = conn.prepareStatement(sql);
      pstmt.setString(1, bean.getRqa_content());
      pstmt.setString(2, bean.getUser_id());
      pstmt.setInt(3, bean.getQa_num());
      
      pstmt.execute();
      conn.close();
   }
   
   public static ArrayList<RqaBean> getReplyList(int qa_num) throws Exception{
      
      Connection conn = DBConnector.getConnection();
      
      String sql = "select * from RQA_TABLE "
               + "where QA_NUM=? "
                 + "order by RQA_NUM"; //오른차순 정렬 
      PreparedStatement pstmt
               = conn.prepareStatement(sql);
      pstmt.setInt(1, qa_num);
      
      ResultSet rs = pstmt.executeQuery();
      // ArrayList 생성
      ArrayList<RqaBean> list
                  = new ArrayList<RqaBean>();
      //로우의 끝까지 반복한다.
      while(rs.next()){
         //데이터를 추출한다.
         int rqa_num = rs.getInt("RQA_NUM");
         String rqa_content = rs.getString("RQA_CONTENT");
         String user_id = rs.getString("USER_ID");
         int qa_num2 = rs.getInt("QA_NUM");
         // 빈 객체를 담는다.
         RqaBean bean = new RqaBean();
         bean.setRqa_num(rqa_num);
         bean.setRqa_content(rqa_content);
         bean.setUser_id(user_id);
         bean.setQa_num(qa_num2);
         //리스트에 담는다.
         list.add(bean);
      }
      
      conn.close();
      return list;
      
   }
   //댓글을 삭제하는 메서드
   public static void remove_reply(int rqa_num) throws Exception{
      Connection conn = DBConnector.getConnection();
      
      String sql = "delete from RQA_TABLE "
               + "where RQA_NUM=?";
      
      PreparedStatement pstmt
                  = conn.prepareStatement(sql);
      pstmt.setInt(1, rqa_num);
      
      pstmt.execute();
      
      conn.close();
   }
   // 글 해당 아이디의 글을 가져오는 메서드
      // [파라미터]
      // page_num : 페이지 번호
      // [리턴]
      // 해당 페이지에 보여줄 글의 정보를 가지고 있는 컬렉션
      public static ArrayList<BoardBean> 
            get_board_all_id(int page_num ,String user_id) throws Exception {
         
         Connection conn = DBConnector.getConnection();
         
         String sql = "select * from "
                + "(select rownum as rnum, a1.* from "
                + "(select (select count(*) from RQA_TABLE where QA_NUM=f1.QA_NUM) as RQA_CNT, f1.QA_NUM, f1.QA_TITLE, f1.QA_CNT, f1.USER_ID, f2.USER_NAME from QA_TABLE f1, MEMBER_TABLE f2 where f1.USER_ID=f2.USER_ID and f1.USER_ID=? " 
                + "order by f1.QA_NUM desc) a1) a2 " 
                + "where a2.rnum >= ? and a2.rnum <= ?";
         
         int min = 1 + ((page_num - 1) * 5);
         int max = min + (5 - 1);
         
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, user_id);
         pstmt.setInt(2, min);
         pstmt.setInt(3, max);
         
         ResultSet rs = pstmt.executeQuery();
         // 데이터 담을 컬렉션
         ArrayList<BoardBean> list = new ArrayList<BoardBean>();
         // 데이터의 개수만큼 반복
         while(rs.next()){
            int qa_num = rs.getInt("QA_NUM");
            String qa_title = rs.getString("QA_TITLE");
            String user_name = rs.getString("USER_NAME");
            int qa_cnt = rs.getInt("QA_CNT");
            int rqa_cnt = rs.getInt("RQA_CNT");
            // 빈 객체에 담는다.
            BoardBean sub = new BoardBean();
            sub.setQa_num(qa_num);
            sub.setQa_title(qa_title);
            sub.setUser_name(user_name);
            sub.setQa_cnt(qa_cnt);
            sub.setRqa_cnt(rqa_cnt);
            // 컬렉션에 담아준다.
            list.add(sub);
         }
         
         
         conn.close();
         
         return list;
         
      }
      

   
      
      
}











