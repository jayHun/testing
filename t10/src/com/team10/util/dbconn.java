package com.team10.util;

import java.sql.*;

public class dbconn {

   //1. �����ͺ��̽� ���� ����
   public static Connection getConn() 
         throws ClassNotFoundException, SQLException {
	   
	  Connection conn = null; //Connection(�����ͺ��̽� ����) ��ü ����� ���� ����
	  
      try{
         if (conn == null) {
   
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            String url = "jdbc:oracle:thin:@10.64.77.198:1521:orcl"; 
   
            conn = DriverManager.getConnection(url,"team10","team10");
            
         }
      }
      
      catch(Exception e){
         System.out.println(e);
      }
      
      return conn;
   }
}