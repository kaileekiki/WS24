package org.example.ws242.controller;

import com.oreilly.servlet.MultipartRequest;
import org.example.ws242.service.ItemService;
import org.example.ws242.vo.ItemVO;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;


@Controller
@RequestMapping(value="/item")
public class ItemController {
    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String itemList(Model model) {
        model.addAttribute("itemlist", itemService.getItemList());
        return "itemlist";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addItemForm() {
        return "additem";
    }

    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addItem(HttpServletRequest request, @SessionAttribute(value = "login", required = false) UserVO loggedInUser) {
        if (loggedInUser == null) {
            // 로그인이 안 된 경우 처리
            System.out.println("로그인이 필요합니다.");
            return "redirect:/login/login";
        }

        int sizeLimit = 15 * 1024 * 1024; // 15MB
        String realPath = request.getServletContext().getRealPath("/resources/img");
        System.out.println("File saved at: " + realPath);


        // 디렉토리 생성
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        try {
            com.oreilly.servlet.MultipartRequest multipartRequest = new MultipartRequest(
                    request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            // Form 데이터 가져오기
            String title = multipartRequest.getParameter("title");
            String content = multipartRequest.getParameter("content");
            String region = multipartRequest.getParameter("region");
            float price = Float.parseFloat(multipartRequest.getParameter("price"));
            String itemLink = multipartRequest.getParameter("itemLink");
            String kakao = multipartRequest.getParameter("kakaoLink");
            int peopleLimit = Integer.parseInt(multipartRequest.getParameter("peopleLimit"));
            String filename = multipartRequest.getFilesystemName("filename");

            // ItemVO 객체 생성
            ItemVO item = new ItemVO();
            item.setTitle(title);
            item.setContent(content);
            item.setRegion(region);
            item.setPrice(price);
            item.setItemLink(itemLink);
            item.setKakao(kakao);
            item.setPeopleLimit(peopleLimit);
            item.setFilename(filename);

            // 세션에서 가져온 user_id 설정
            item.setUserVO(loggedInUser);

            // DB에 저장
            itemService.addItem(item);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/item/add";
        }
        return "redirect:/item/list";
    }


    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String viewItem(@RequestParam("id") int id, Model model) {
        // id에 해당하는 상품 정보를 가져와서 model에 담음
        ItemVO item = itemService.getItemById(id);
        model.addAttribute("item", item);  // 상품 상세 정보를 JSP로 전달
        return "viewitem";  // JSP의 viewitem.jsp로 이동
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteItem(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
        itemService.deleteItem(id); // 삭제 처리
        redirectAttributes.addFlashAttribute("message", "상품이 성공적으로 삭제되었습니다.");
        return "redirect:/mypage";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editItemForm(@RequestParam("id") int id, Model model) {
        ItemVO item = itemService.getItemById(id);
        model.addAttribute("item", item);
        return "editItemForm"; // JSP 파일로 연결
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editItem(@ModelAttribute ItemVO item) {
        itemService.updateItem(item); // 서비스 호출로 수정 처리
        return "redirect:/mypage?message=상품이 성공적으로 수정되었습니다.";
    }

}
