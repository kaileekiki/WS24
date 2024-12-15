package org.example.ws242.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.example.ws242.vo.ItemVO;
import org.example.ws242.vo.JoinedItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class JoinedItemDAO {
    @Autowired
    private SqlSession sqlSession;

    public JoinedItemVO getJoinItemById(String userid, int itemid) {
        Map<String, Object> params = new HashMap<>();
        params.put("userid", userid);
        params.put("itemid", itemid);
        return sqlSession.selectOne("getJoinItemById", params);
    }

    public int insertJoinedItem(JoinedItemVO join) {
        return sqlSession.insert("joinitem.insertJoinedItem", join);
    }
}
