package org.example.ws242.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.ws242.vo.SubscribeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubscribeDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<SubscribeVO> getSubsList() {
        List<SubscribeVO> list = sqlSession.selectList("Subscribe.getSubs");
        return list;
    }
    public int insertSubscribe(SubscribeVO subscribe) {
        return sqlSession.insert("Subscribe.insertSubscribe", subscribe);
    }

    public SubscribeVO getSubscribeById(int id) {
        return sqlSession.selectOne("Subscribe.getSubscribeById", id);
    }

    // Fetch subscriptions by user ID
    public List<SubscribeVO> getSubscribesByUserId(String userId) {
        return sqlSession.selectList("Subscribe.getSubscribesByUserId", userId);
    }
}
