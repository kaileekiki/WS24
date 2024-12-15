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
public class JoinedSubVO {
    private int id;
    private Date regdate;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name ="User_Id" )
    private UserVO userVO; //구매에 관심잇어하는 유저
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name ="Subscribe_Id" )
    private SubscribeVO subscribeVO;
}
