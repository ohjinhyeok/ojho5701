package hyeok.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import hyeok.resource.session.MybatisSession;
import hyeok.vo.ToDoVO;
import hyeok.vo.boardVO;

public class boardDAO {
	
	private SqlSession sqlSession;
	private boolean result;
	private int rs;
	
	public List <boardVO> getAllboard(){
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		List <boardVO> list = null;
		try {
			list = sqlSession.selectList("getAllboard");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}
	
	public List <boardVO> getSelectboard(int i){
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		List <boardVO> list = null;
		boardVO bvo = new boardVO();
		bvo.setI(i);
		try {
			list = sqlSession.selectList("getSelectboard",i);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}
	
	public boardVO getModboard(int mid){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		boardVO bvo = new boardVO();
		boardVO bvo2 = new boardVO();
		try {
			bvo.setMid(mid);
			System.out.println("3 : " + bvo.getMid());
			bvo2 = sqlSession.selectOne("getModboard", bvo);
			System.out.println("4 : " + bvo2.getMid());
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return bvo2;
	}
	public List <boardVO> countboard(){
	  sqlSession = MybatisSession.getSqlSessinFactory().openSession();
	  List <boardVO> list = null;
		try {
			list =sqlSession.selectList("countboard");
			System.out.println("알에스"+rs);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}
	public boolean addboard(boardVO bvo){
		System.out.println("1번"+bvo.getMid()+bvo.getSubject());
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			System.out.println("2번"+bvo.getMid()+bvo.getSubject());
			result = sqlSession.insert("addboard", bvo) == 1;
			System.out.println("3번"+bvo.getMid()+bvo.getSubject());
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
	public boolean baddboard(boardVO bvo){
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.insert("baddboard", bvo) == 1;
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
	public boolean modboard(boardVO bvo){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		
		try {
			result = sqlSession.update("modboard", bvo) == 1;
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
	public boolean delboard(int mid){
		
		sqlSession = MybatisSession.getSqlSessinFactory().openSession();
		try {
			result = sqlSession.delete("delboard", mid) == 1;
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
}
