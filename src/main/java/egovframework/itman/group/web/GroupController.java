package egovframework.itman.group.web;

import egovframework.itman.group.service.GroupVO;
import egovframework.itman.group.service.impl.GroupServiceImpl;
import egovframework.itman.member.service.MemberVO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    public String selectGroupList(HttpSession session, Model model) throws Exception {
        session.removeAttribute("groIdx");
        session.removeAttribute("group");
        String memIdx = ((MemberVO) session.getAttribute("loginUser")).getMemIdx();
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

    @PostMapping("/itman/setGroIdx.do")
    @ResponseBody
    public ResponseEntity<String> setSessionValue(@RequestParam("groIdx") String groIdx, HttpSession session) {
        session.setAttribute("groIdx", groIdx);
        GroupVO vo = groupService.selectGroup(groIdx);
        session.setAttribute("group", vo);
        return ResponseEntity.ok("success");
    }
    @RequestMapping("/itman/myGroup.do")
    public String myGroup(HttpSession session, Model model) throws Exception {
        MemberVO member = (MemberVO) session.getAttribute("member");
        List<GroupVO> list = groupService.getAllGroupData(member.getMemIdx());
        model.addAttribute("resultList", list);
        return "itman/public/html/user/myGroup";
    }

    @RequestMapping("/itman/editGroup.do")
    public String editGroup(GroupVO vo, HttpSession session, Model model) {
        GroupVO group = groupService.selectGroup(vo.getGroIdx());
        model.addAttribute("group", group);
        return "itman/public/html/user/groupWrite";
    }
    @PostMapping("/itman/updateGroup.do")
    public String updateGroup(GroupVO vo, HttpSession session, Model model,
                              @RequestParam(value = "groImgFile" , required = false) MultipartFile file,
                              HttpServletRequest request) throws Exception {
        vo.setGroImg(groupService.selectGroup(vo.getGroIdx()).getGroImg());
        if(!file.isEmpty()){
            System.err.println("!file.isEmpty");
            System.err.println(file.getOriginalFilename());
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
        groupService.updateGroup(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/confirmGroupDel.do")
    public String confirmGroupDel(GroupVO vo, HttpSession session, Model model) throws Exception {
        GroupVO selectedVO = groupService.selectGroup(vo.getGroIdx());
        model.addAttribute("group", selectedVO);
        return "itman/public/html/user/groupDel";
    }

    @PostMapping("/itman/deleteGroup.do")
    public String deleteGroup(GroupVO vo, Model model) throws Exception {
        groupService.deleteGroup(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

}
