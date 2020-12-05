package mybatis;

import java.io.Reader;
import java.sql.Connection;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.TransactionIsolationLevel;


public class OracleMyBatisSqlSessionFactory implements SqlSessionFactory {

	
	private static SqlSessionFactory sqlSessionFactory;
	static {
		
		String config="mybatis/config/sqlConfig.xml";
		
		try {
			Reader reader=Resources.getResourceAsReader(config);
			
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
			
			/*reader.close();*/
			
			System.out.println("sqlSessionFactory 성공했습니다.");
		}catch(Exception e) {			
			System.out.println("sqlSessionFactory 실패했습니다.");
			e.printStackTrace();
		}
		
	}
	
	@Override
	public Configuration getConfiguration() {		
		return sqlSessionFactory.getConfiguration();
	}
	
	
	@Override
	public SqlSession openSession() {		
		return sqlSessionFactory.openSession();
	}

	@Override
	public SqlSession openSession(boolean autoCommit) {		
		return sqlSessionFactory.openSession(autoCommit);
	}

	@Override
	public SqlSession openSession(Connection conn) {		
		return sqlSessionFactory.openSession(conn);
	}

	@Override
	public SqlSession openSession(TransactionIsolationLevel transLevel) {		
		return sqlSessionFactory.openSession(transLevel);
	}

	@Override
	public SqlSession openSession(ExecutorType exeType) {		
		return sqlSessionFactory.openSession(exeType);
	}

	@Override
	public SqlSession openSession(ExecutorType exeType, boolean autoCommit) {
		return sqlSessionFactory.openSession(exeType,autoCommit);
	}

	@Override
	public SqlSession openSession(ExecutorType exeType, TransactionIsolationLevel transLevel) {
		return sqlSessionFactory.openSession(exeType,transLevel);
	}

	@Override
	public SqlSession openSession(ExecutorType exeType, Connection conn) {
		return sqlSessionFactory.openSession(exeType,conn);
	}
	
	
}
