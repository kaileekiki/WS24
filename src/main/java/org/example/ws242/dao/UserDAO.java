package org.example.ws242.dao;

import org.example.ws242.vo.ItemVO;
import org.example.ws242.vo.SubscribeVO;
import org.example.ws242.vo.UserDetailVO;
import org.example.ws242.vo.UserVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAO {
    @Autowired
    SqlSessionTemplate sqlSession;
    public UserVO getUser(UserVO vo) {
        return sqlSession.selectOne("User.getUser", vo);
    }
    public int insertUser(UserVO user) {
        return sqlSession.insert("User.insertUser", user);
    }

    public int checkId(String id) {
        return sqlSession.selectOne("User.checkId", id);
    }

    public UserDetailVO getUserDetails(String userId) {
        return sqlSession.selectOne("User.getUserDetails", userId);
    }

    public List<ItemVO> getItemsByUserId(String userId) {
        return sqlSession.selectList("Item.getItemsByUserId", userId);
    }

    public List<SubscribeVO> getSubscribesByUserId(String userId) {
        return sqlSession.selectList("Subscribe.getSubscribesByUserId", userId);
    }
}
