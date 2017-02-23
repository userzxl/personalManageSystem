/**
 * 
 */
package com.unit.zxl.utils;

import org.apache.log4j.Category;
import org.apache.log4j.Priority;
import org.apache.log4j.spi.LoggingEvent;

/**
 * @author 34848
 * 重写loggingevent,防止单引号冲突
 */
public class MyLoggingEvent extends LoggingEvent {
	private static final long serialVersionUID = -1405129465403337629L;

	/**
	 * @param fqnOfCategoryClass
	 * @param logger
	 * @param level
	 * @param message
	 * @param throwable
	 */
	public MyLoggingEvent(String fqnOfCategoryClass, Category logger,
			Priority level, Object message, Throwable throwable) {
		super(fqnOfCategoryClass, logger, level, message, throwable);
		// TODO Auto-generated constructor stub
	}
	public String getThreadName() {
        String thrdName = super.getThreadName();
        if (thrdName.indexOf("'") != -1) {
            thrdName = thrdName.replaceAll("'", "''");
        }
        return thrdName;
    }

    public String getRenderedMessage() {
        String msg = super.getRenderedMessage();
        if (msg.indexOf("'") != -1) {
            msg = msg.replaceAll("'", "''");
        }
        return msg;
    }

}
