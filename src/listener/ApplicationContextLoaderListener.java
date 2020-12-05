package listener;

import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import action.ApplicationContext;


@WebListener
public class ApplicationContextLoaderListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce)  { 
		Map<String, Object> applicationContext = ApplicationContext.getApplicationContext();
		
		ServletContext ctx = sce.getServletContext();
		Enumeration<String> paramNames = ctx.getInitParameterNames();
		
		while(paramNames.hasMoreElements()) {
			String paramName = paramNames.nextElement();
			String classType = ctx.getInitParameter(paramName);
			
			/*System.out.printf("paramName : %s\tclassType : %s\n", paramName, classType);*/
			
			try {
				
				Class<?> cls = Class.forName(classType);
				
				Object targetObj = cls.newInstance();
				
				System.out.println(paramName + " : " + targetObj);
				
				applicationContext.put(paramName, targetObj);
				
			} catch (Exception e) {
			}
			
			
		}
		
		paramNames = ctx.getInitParameterNames();
		while(paramNames.hasMoreElements()) {
			String paramName = paramNames.nextElement();
			String classType = ctx.getInitParameter(paramName);
			
			try {
				
				Class<?> cls = Class.forName(classType);
				Method[] methods = cls.getMethods();
				
				for(Method method : methods) {
					
					if(method.getName().contains("set")) {
						
						String setInstanceName = ((method.getName().replace("set", "")).charAt(0) + "").toLowerCase() + method.getName().substring(4);
						
						method.invoke(applicationContext.get(paramName),applicationContext.get(setInstanceName) );
						
						System.out.println("instance inject : " + paramName + " - " + method.getName());
						
					}
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
    public void contextDestroyed(ServletContextEvent sce)  { 
    	
    }
	
}
