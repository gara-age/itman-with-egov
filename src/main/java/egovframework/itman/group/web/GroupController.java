package egovframework.itman.group.web;

import egovframework.itman.group.service.GroupVO;
import egovframework.itman.group.service.impl.GroupServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Controller
public class GroupController {
    private final GroupServiceImpl groupService;

    public GroupController(GroupServiceImpl groupService) {
        this.groupService = groupService;
    }

    @RequestMapping("/itman/index.do")
    public String index(Model model) {
        return "itman/public/html/index";
    }
    @RequestMapping("/itman/group.do")
    public String selectGroupList(Model model) throws Exception {
        String memIdx = "1";
       List<GroupVO> list = groupService.selectGroupList(memIdx);
       model.addAttribute("groupList", list);
        return "itman/public/html/group";
    }
    @RequestMapping("/itman/addGroup.do")
    public String addGroup(GroupVO vo, Model model) {
        model.addAttribute("group", vo);
        return "itman/public/html/popup/addGroup";
    }

    @PostMapping("/itman/insertGroup.do")
    public String insertGroup(GroupVO vo,
                              @RequestParam("groImgFile") MultipartFile file
            , Model model) throws Exception {
        if(!file.isEmpty()){
            String fileName = file.getOriginalFilename();
            String uploadDir = "/upload/groImg/";
            File img = new File(uploadDir + fileName);
            file.transferTo(img);
            vo.setGroImg(fileName);
        }
        groupService.insertGroup(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }
}
