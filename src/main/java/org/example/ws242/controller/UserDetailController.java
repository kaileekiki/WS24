package org.example.ws242.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.example.ws242.service.UserDetailService;
import org.example.ws242.vo.UserDetailVO;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
@Controller
@RequestMapping(value = "/userdetail")
public class UserDetailController {

    @Autowired
    private UserDetailService userDetailService;

    /**
     * 사용자 세부정보 추가 폼
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addUserDetailForm(@SessionAttribute(value = "login", required = false) UserVO loggedInUser, Model model) {
        if (loggedInUser == null) {
            System.out.println("로그인이 필요합니다.");
            return "redirect:/login/login";
        }

        // 이미 UserDetail이 존재하는지 확인
        UserDetailVO existingDetail = userDetailService.getUserDetailByUserId(loggedInUser.getUserid());
        if (existingDetail != null) {
            System.out.println("이미 유저 디테일이 존재합니다.");
            model.addAttribute("errorMessage", "이미 유저 디테일이 존재합니다. 수정 페이지를 이용하세요.");
            return "redirect:/mypage";
        }

        return "adduserdetail"; // 추가 폼으로 이동
    }

    /**
     * 사용자 세부정보 추가 처리
     */
    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addUserDetail(HttpServletRequest request, @SessionAttribute(value = "login", required = false) UserVO loggedInUser, Model model) {
        if (loggedInUser == null) {
            System.out.println("로그인이 필요합니다.");
            return "redirect:/login/login";
        }

        // 이미 UserDetail이 존재하는지 확인
        UserDetailVO existingDetail = userDetailService.getUserDetailByUserId(loggedInUser.getUserid());
        if (existingDetail != null) {
            System.out.println("이미 유저 디테일이 존재합니다.");
            model.addAttribute("errorMessage", "이미 유저 디테일이 존재합니다. 수정 페이지를 이용하세요.");
            return "redirect:/mypage";
        }

        int sizeLimit = 15 * 1024 * 1024; // 15MB
        String realPath = request.getServletContext().getRealPath("/resources/img");
        System.out.println("File saved at: " + realPath);

        // 디렉토리 생성
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        try {
            MultipartRequest multipartRequest = new MultipartRequest(
                    request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            // Form 데이터 가져오기
            String nickname = multipartRequest.getParameter("nickname");
            String phoneNum = multipartRequest.getParameter("phoneNum");
            String kakao = multipartRequest.getParameter("kakao");
            String filename = multipartRequest.getFilesystemName("filename");

            // UserDetailVO 객체 생성
            UserDetailVO userDetail = new UserDetailVO();
            userDetail.setNickname(nickname);
            userDetail.setPhoneNum(Integer.parseInt(phoneNum));
            userDetail.setKakao(kakao);
            userDetail.setFilename(filename);

            // 세션에서 가져온 user_id 설정
            userDetail.setUserVO(loggedInUser);

            // DB에 저장
            userDetailService.insertUserDetail(userDetail);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/userdetail/add";
        }
        return "redirect:/mypage";
    }

}
