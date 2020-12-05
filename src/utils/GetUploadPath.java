package utils;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class GetUploadPath {
	
	
	private static Properties properties = new Properties();
	
	static {
		String resource = "properties/uploadPath.properties";
		
		Reader reader;
		try {
			reader = Resources.getResourceAsReader(resource);
			properties.load(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static String getUploadPath(String key) {
		String uploadPath =null;
		uploadPath=properties.getProperty(key);
		
		uploadPath=uploadPath.replace("/", File.separator);
		
		return uploadPath;
	}
}
