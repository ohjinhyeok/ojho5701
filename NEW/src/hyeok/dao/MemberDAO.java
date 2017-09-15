package hyeok.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import hyeok.resource.session.MybatisSession;
import hyeok.vo.MemberVO;

public class MemberDAO {

	private SqlSession sqlSession;
	private boolean result;
		
	public List <MemberVO> getAllMember(){
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		List<MemberVO> list = null;
			try {
				list = sqlSession.selectList("getAllMember");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				sqlSession.close();
			}
			return list;
			
		}
}
