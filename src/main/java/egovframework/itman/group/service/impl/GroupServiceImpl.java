package egovframework.itman.group.service.impl;

import egovframework.itman.group.service.GroupService;
import egovframework.itman.group.service.GroupVO;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("groupService")
public class GroupServiceImpl implements GroupService {
    @Resource(name = "groupDAO")
    GroupDAO groupDAO;

            @Override
            public GroupVO getHeaderData(GroupVO vo) throws Exception{
               return groupDAO.getHeaderData(vo);
            }

            @Override
            public List<GroupVO> selectGroupList(String memIdx) throws Exception{
                return groupDAO.selectGroupList(memIdx);
            }

            @Override
            public List<GroupVO> getAllGroupData(String memIdx) throws Exception{
                return groupDAO.getAllGroupData(memIdx);
            }

            @Override
            public void insertGroup(GroupVO vo) throws Exception{
                groupDAO.insertGroup(vo);
            }

            @Override
            public void updateGroup(GroupVO vo) throws Exception{
                groupDAO.updateGroup(vo);
            }

            @Override
            public void deleteGroup(GroupVO vo) throws Exception{
                groupDAO.deleteGroup(vo);
            }
}
