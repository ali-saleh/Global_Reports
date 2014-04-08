package actions;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8472781150030523362L;
	
	protected String convertDateFormat(String date) {
		String[] parts = date.split("/");

		ArrayUtils.reverse(parts);

		return StringUtils.join(parts, '-');
	}
}
