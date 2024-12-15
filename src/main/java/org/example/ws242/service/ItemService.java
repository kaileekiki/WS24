package org.example.ws242.service;

import org.example.ws242.dao.ItemDAO;
import org.example.ws242.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService {
    @Autowired
    private ItemDAO itemDAO;

    public List<ItemVO> getItemList() {
        return itemDAO.getItemList();
    }

    public int addItem(ItemVO item) {
        return itemDAO.insertItem(item);
    }

    public ItemVO getItemById(int id) {
        return itemDAO.getItemById(id);
    }

    // Retrieve items by user ID
    public List<ItemVO> getItemsByUserId(String userId) {
        return itemDAO.getItemsByUserId(userId);
    }

    public void incrementPeople(int id) {
        itemDAO.incrementPeople(id);
    }
    public void deleteItem(int id) {
        itemDAO.deleteItem(id);
    }

    public void updateItem(ItemVO item) {
        itemDAO.updateItem(item);
    }
}
