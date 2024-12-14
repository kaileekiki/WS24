package org.example.ws242.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.ws242.vo.UserDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDetailDAO {
    @Autowired
    private SqlSession sqlSession;

    public UserDetailVO getUserDetailByUserId(String userId) {
        return sqlSession.selectOne("UserDetail.getUserDetailByUserId", userId);
    }

    public int insertUserDetail(UserDetailVO userDetail) {
        return sqlSession.insert("UserDetail.insertUserDetail", userDetail);
    }
}

