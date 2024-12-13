package org.example.ws242.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.ws242.vo.ItemVO;
import org.example.ws242.vo.SubscribeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubscribeDAO {
    @Autowired
    SqlSession sqlSession;

    public List<SubscribeVO> getSubsList() {
        List<SubscribeVO> list = sqlSession.selectList("Subscribe.getSubs");
        return list;
    }
}