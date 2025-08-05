package egovframework.itman.assLog.service.impl;

import egovframework.itman.assLog.service.AssLogService;
import egovframework.itman.assLog.service.AssLogVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("assLogService")
public class AssLogServiceImpl implements AssLogService {
    @Resource
    AssLogDAO assLogDAO;

    @Override
    public void insertAssLog(AssLogVO assLogVO){
        assLogDAO.insertAssLog(assLogVO);
    }

    @Override
    public List<AssLogVO> selectAssLogList(String assIdx) {
        return assLogDAO.selectAssLogList(assIdx);
    }


}
