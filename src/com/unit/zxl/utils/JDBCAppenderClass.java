/**
 * 
 */
package com.unit.zxl.utils;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.log4j.Category;
import org.apache.log4j.Priority;
import org.apache.log4j.jdbc.JDBCAppender;
import org.apache.log4j.spi.LoggingEvent;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

/**
 * @author 34848
 *
 */
public class JDBCAppenderClass extends JDBCAppender {

	private JdbcDaoSupport jdbcDaoSupport;
	
	
	protected String getLogStatement(LoggingEvent event) {
		String fqnOfCategoryClass=event.fqnOfCategoryClass;
		Category logger=Category.getRoot();
		Priority level=event.level;
		Object message=event.getMessage();
		Throwable throwable=null;
		MyLoggingEvent bEvent=new MyLoggingEvent(fqnOfCategoryClass,logger,level,message,throwable);
		return super.getLogStatement(bEvent);
	}

	/*@Override
	protected void closeConnection(Connection con) {
		try {
			if(con != null && !con.isClosed()){
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void execute(String arg0) throws SQLException {
		// TODO Auto-generated method stub
		super.execute(arg0);
	}

	@Override
	protected Connection getConnection() throws SQLException {
		if(jdbcDaoSupport == null){
			jdbcDaoSupport = spring
		}
	}

	@Override
	protected String getLogStatement(LoggingEvent event) {
		// TODO Auto-generated method stub
		return super.getLogStatement(event);
	}*/
	
	
}
