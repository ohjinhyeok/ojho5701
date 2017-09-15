package hyeok.dao;
import hyeok.resource.session.MybatisSession;
import hyeok.vo.ToDoVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;


import hyeok.vo.ToDoVO;

public class ToDoDAO {
	private SqlSession sqlSession;
	private boolean result;
	
	
	public boolean addToDo(ToDoVO tvo){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.insert("addToDo", tvo) == 1;
			if(result){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return result;
	}
	public boolean baddToDo(ToDoVO tvo){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.insert("baddToDo", tvo) == 1;
			if(result){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return result;
	}
	public boolean BatAddToDo(ToDoVO tvo){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.insert("BatAddToDo", tvo) == 1;
			if(result){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return result;
	}
	public boolean delToDo(int todoNo){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.delete("delToDo", todoNo) == 1;
			if (result) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	public ToDoVO getModToDo(int todoNo){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		ToDoVO tvo = null;
		try {
			tvo = sqlSession.selectOne("getModToDo", todoNo);
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return tvo;
	}
	public List <ToDoVO> getOneToDo(){
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		List<ToDoVO> list = null;
		try {
			list = sqlSession.selectList("getOneToDo");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}
	public List <ToDoVO> BatgetOneToDo(){
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		List<ToDoVO> list = null;
		try {
			list = sqlSession.selectList("BatgetOneToDo");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}
	public List <ToDoVO> getAllBat(){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		
		List<ToDoVO> list = null;
		
		try {
			
			list = sqlSession.selectList("getAllBat");
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
		
	}
	public ToDoVO getOneMember(String userId){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		ToDoVO tvo = null;
		try {
			tvo = sqlSession.selectOne("getOneMember", userId);
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return tvo;
	}
	public ToDoVO todoModToDo(int todoNo){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		ToDoVO tvo = null;
		
		try {
			tvo = sqlSession.selectOne("todoModToDo", todoNo);
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return tvo;
	}
	
	public boolean BatdelToDo(int todoNo){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.delete("BatdelToDo", todoNo) == 1;
			if (result) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	public boolean BtodoModToDo(ToDoVO tvo){//메모
		System.out.println("넘버 : "+tvo.getTodoNo());
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.update("BtodoModToDo", tvo) == 1;
			if(result){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return result;
	}
	public boolean modToDo(ToDoVO tvo){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.update("modToDo", tvo) == 1;
			if(result){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return result;
	}
	public boolean BatModToDo(ToDoVO tvo){//젠더
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.update("BatModToDo", tvo) == 1;
			if(result){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return result;
	}
}
