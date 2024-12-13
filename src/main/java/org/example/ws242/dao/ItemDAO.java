package org.example.ws242.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.ws242.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemDAO {
    @Autowired
    SqlSession sqlSession;

    public List<ItemVO> getItemList() {
        List<ItemVO> list = sqlSession.selectList("Item.getItems");
        return list;
    }

    public int insertItem(ItemVO item) {
        return sqlSession.insert("Item.insertItem", item);
    }

}