package egovframework.itman.group.service;

import java.util.List;

public interface GroupService {
    GroupVO getHeaderData(GroupVO vo) throws Exception;
    List<GroupVO> selectGroupList(String memIdx) throws Exception;
    List<GroupVO> getAllGroupData(String memIdx) throws Exception;
    void insertGroup(GroupVO vo) throws Exception;
    void updateGroup(GroupVO vo) throws Exception;
    void deleteGroup(GroupVO vo) throws Exception;
}
