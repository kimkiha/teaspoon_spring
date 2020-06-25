package com.kh.teaspoon.store.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.store.model.vo.Product;
import com.kh.teaspoon.store.model.vo.Review;

@Repository("stDao")
public class StoreDao {

	public int selectProductListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeMapper.selectProductListCount");
	}

	public ArrayList<Product> selectProductList(PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeMapper.selectProductList", null, rowBounds);
	}

	public int insertProduct(Product p, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("storeMapper.insertProduct", p);
	}

	public Product selectProduct(int productNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeMapper.selectProduct", productNo);
	}

	public int updateProduct(Product p, SqlSessionTemplate sqlSession) {
		return sqlSession.update("storeMapper.updateProduct", p);
	}

	public int deleteProduct(int productNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("storeMapper.deleteProduct", productNo);
	}

	public int selectReviewListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeMapper.selectReviewListCount");
	}

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeMapper.selectReviewList", null, rowBounds);
	}

	public Review selectReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.selectOne("storeMapper.selectReview", reviewNo);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.update("storeMapper.deleteReview", reviewNo);
	}

	
	
}
