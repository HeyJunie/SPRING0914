package dao;

import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.DBService;

public class ReplyDao {

	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private ReplyDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static ReplyDao replyDao = new ReplyDao();
	public static ReplyDao getInstance() {
		return replyDao;
	}
	
	// 메소드

	
}