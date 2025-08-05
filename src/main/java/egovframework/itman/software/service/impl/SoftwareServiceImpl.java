package egovframework.itman.software.service.impl;

import egovframework.itman.software.service.SoftwareService;
import egovframework.itman.software.service.SoftwareVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("softwareService")
public class SoftwareServiceImpl implements SoftwareService {
    @Resource
    SoftwareDAO softwareDAO;

    @Override
    public List<SoftwareVO> selectSoftwareList(String assIdx) throws Exception{
        return softwareDAO.selectSoftwareList(assIdx);
    }
}
