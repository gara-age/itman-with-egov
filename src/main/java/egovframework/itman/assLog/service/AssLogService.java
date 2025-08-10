package egovframework.itman.assLog.service;

import egovframework.itman.common.Pagination;

import java.util.List;

public interface AssLogService {
    void insertAssLog(AssLogVO assLogVO);
    List<AssLogVO> selectAssLogList(String assIdx);
    List<AssLogVO> selectDashBoardAssLogList(String groIdx);
    List<AssLogVO> selectAllAssLogList(Pagination pagination);
    int selectAssLogListCnt(Pagination pagination);
}
