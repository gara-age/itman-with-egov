package egovframework.itman.group.web;

import egovframework.itman.group.service.GroupVO;
import egovframework.itman.group.service.impl.GroupServiceImpl;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.annotation.Resource;

@ControllerAdvice
public class GroupCommonDataController {

    @Resource(name = "groupService")
    GroupServiceImpl groupService;

    @ModelAttribute("headerData")
    public GroupVO getHeaderData(GroupVO vo) throws Exception {
        vo.setGroIdx("1");
        return  groupService.getHeaderData(vo);

    }
}
