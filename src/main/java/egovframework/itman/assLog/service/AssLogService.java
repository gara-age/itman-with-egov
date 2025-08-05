package egovframework.itman.assLog.service;

import java.util.List;

public interface AssLogService {
    void insertAssLog(AssLogVO assLogVO);
    List<AssLogVO> selectAssLogList(String assIdx);
}
