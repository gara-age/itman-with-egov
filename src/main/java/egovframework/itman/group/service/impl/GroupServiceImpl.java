package egovframework.itman.group.service.impl;

import egovframework.itman.group.service.GroupService;
import egovframework.itman.group.service.GroupVO;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("groupService")
public class GroupServiceImpl implements GroupService {
    @Resource(name = "groupDAO")
    GroupDAO groupDAO;

            @Override
            public GroupVO getHeaderData(GroupVO vo) throws Exception{
               return groupDAO.getHeaderData(vo);
            }
}
