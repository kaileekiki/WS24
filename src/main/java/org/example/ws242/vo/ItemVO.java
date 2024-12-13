package org.example.ws242.vo;
import jakarta.persistence.CascadeType;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ItemVO {
    private int id;
    private Date regdate;
    private String title;
    private String content;
    private String region;
    private float price;
    private String itemLink;
    private String kakao;
    private int peopleLimit;
    private int people;
    private String filename;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "User_Id")
    private UserVO userVO;
}
