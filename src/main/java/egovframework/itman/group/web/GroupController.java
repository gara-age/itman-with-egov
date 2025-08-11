package egovframework.itman.group.web;

import egovframework.itman.group.service.GroupVO;
import egovframework.itman.group.service.impl.GroupServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
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
                              @RequestParam(value = "groImgFile" , required = false) MultipartFile file,
                              HttpServletRequest request
            , Model model) throws Exception {
        if(!file.isEmpty()){
            String uploadDir = "/upload/groImg/";
            String realDir = request.getServletContext().getRealPath(uploadDir);
            File dir = new File(realDir);
            if(!dir.exists()) {
                dir.mkdirs();
            }

            String originalFileName = file.getOriginalFilename();
            String ext = (originalFileName != null && originalFileName.lastIndexOf('.') != -1) ? originalFileName.substring(originalFileName.lastIndexOf('.')) : "";
            String prefix = "groupImg";
            String datePart = new java.text.SimpleDateFormat("yyyyMMdd_HHmmss").format(new java.util.Date());
            String randomPart = java.util.UUID.randomUUID().toString().replace("-", "").substring(0, 6).toUpperCase();
            String savedName = prefix + "_" + datePart + "_" + randomPart + ext;
            File img = new File(dir, savedName);
            file.transferTo(img);
            vo.setGroImg(savedName);
        }
        groupService.insertGroup(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

}
