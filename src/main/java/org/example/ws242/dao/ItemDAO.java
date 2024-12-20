//package org.example.ws242.dao;
//
//import org.apache.ibatis.session.SqlSession;
//import org.example.ws242.vo.ItemVO;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
//@Repository
//public class ItemDAO {
//    @Autowired
//    SqlSession sqlSession;
//
//    public List<ItemVO> getItemList() {
//        List<ItemVO> list = sqlSession.selectList("Item.getItems");
//        return list;
//    }
//
//
//    public int insertItem(ItemVO item) {
//        return sqlSession.insert("Item.insertItem", item);
//    }
//
//    public ItemVO getItemById(int id) {
//        return sqlSession.selectOne("Item.getItemById", id);  // 상품 아이디로 조회
//    }
//
//}

package org.example.ws242.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.ws242.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<ItemVO> getItemList() {
        List<ItemVO> list = sqlSession.selectList("Item.getItems");
        return list;
    }

    public int insertItem(ItemVO item) {
        return sqlSession.insert("Item.insertItem", item);
    }

    public ItemVO getItemById(int id) {
        return sqlSession.selectOne("Item.getItemById", id);
    }

    // Fetch items by user ID
    public List<ItemVO> getItemsByUserId(String userId) {
        return sqlSession.selectList("Item.getItemsByUserId", userId);
    }
    public void incrementPeople(int id) {
        sqlSession.update("Item.incrementPeople", id);
    }

    public void deleteItem(int id) {
        sqlSession.delete("Item.deleteItem", id);
    }

    public void updateItem(ItemVO item) {
        sqlSession.update("Item.updateItem", item);
    }

    public List<ItemVO> searchItemsByTitle(String query) {
        return sqlSession.selectList("Item.searchItemsByTitle", "%" + query + "%");
    }
}
