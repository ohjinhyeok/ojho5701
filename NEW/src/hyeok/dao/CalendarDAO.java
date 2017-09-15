package hyeok.dao;
import hyeok.resource.session.MybatisSession;
import hyeok.vo.CalVO;
import hyeok.vo.ToDoVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import hyeok.vo.ToDoVO;
public class CalendarDAO {
	private SqlSession sqlSession;
	private boolean result;
	
/*	public CalVO getAllCal(String userId){
		userId= "USER";
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		CalVO cvo = null;
		try {
			System.out.println("안에"+userId);
			
			cvo = sqlSession.selectOne("getAllCal", userId);
			System.out.println(cvo);
			System.out.println("나옴");
			System.out.println(cvo.getNo());
			System.out.println(cvo.getMemo());
			System.out.println(cvo.getRegDate());
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return cvo;
	}*/
	public List <CalVO> getAllCal(String userId){
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		List<CalVO> list = null;
		System.out.println("안에"+userId);
		try {
			list = sqlSession.selectList("getAllCal", userId);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}









}





