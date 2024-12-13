package org.example.ws242.controller;

import com.oreilly.servlet.MultipartRequest;
import org.example.ws242.service.ItemService;
import org.example.ws242.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
    public String addItem(HttpServletRequest request) {
        int sizeLimit = 15 * 1024 * 1024; // 15MB
        String realPath = request.getServletContext().getRealPath("/resources/img");

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

            // DB에 저장
            itemService.addItem(item);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/item/add";
        }
        return "redirect:/item/list";
    }

}
