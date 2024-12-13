package org.example.ws242.service;

import org.example.ws242.dao.ItemDAO;
import org.example.ws242.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService {

    @Autowired
    ItemDAO itemDAO;

    public List<ItemVO> getItemList() {
        return itemDAO.getItemList();
    }
}
