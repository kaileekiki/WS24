package org.example.ws242.vo;

import jakarta.persistence.CascadeType;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UserDetailVO {
    private int id;
    private Date regdate;
    private String nickname;
    private int phoneNum;
    private String kakao;
    private String filename;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name ="User_Id" )
    private UserVO userVO;
}
