package org.example.ws242.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.ws242.vo.JoinedItemVO;
import org.example.ws242.vo.JoinedSubVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class JoinedSubscribeDAO {
    @Autowired
    private SqlSession sqlSession;

    public JoinedSubVO getJoinSubscribeById(String userid, int subscribeid) {
        Map<String, Object> params = new HashMap<>();
        params.put("userid", userid);
        params.put("subscribeid", subscribeid);
        return sqlSession.selectOne("getJoinSubscribeById", params);
    }

    public int insertJoinedSubscribe(JoinedSubVO join) {
        return sqlSession.insert("joinsubscribe.insertJoinedSubscribe", join);
    }
}
