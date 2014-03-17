/**
 * 
 */
package utils;

import java.io.IOException;
import java.util.Properties;

/**
 * @author Zrieq
 * 
 */
public class GCProperties {

	private static GCProperties ref;
	private Properties prop = null;

	private GCProperties() throws IOException {
		prop = new Properties();
		prop.load(GCProperties.class
				.getResourceAsStream("./properties/client_messages.properties"));
	}

	public static GCProperties getSystemProperties() throws IOException {
		if (ref == null) {
			
			// it's ok, we can call this constructor
			ref = new GCProperties();
		}
		return ref;
	}

	public String get(String key) throws Exception {
		String retValue = prop.getProperty(key);
		// all the system properties have to be there
		if (retValue == null) {
			throw new Exception("Missing system property: " + key);
		}

		return retValue;
	}

	public String get(String key, String defaultValue) {
		return prop.getProperty(key, defaultValue);
	}
}
