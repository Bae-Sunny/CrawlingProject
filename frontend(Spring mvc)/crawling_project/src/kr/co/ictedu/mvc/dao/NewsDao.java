package kr.co.ictedu.mvc.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.mvc.dto.NewsVO;

@Repository
public class NewsDao implements NewsDaoInter{

	@Autowired
	private SqlSessionTemplate ss;


	@Override
	public NewsVO detail(int num) {
		return ss.selectOne("news.newsDetail",num);
	}



	
	
}
