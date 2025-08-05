package egovframework.itman.hardware.service.impl;

import egovframework.itman.hardware.service.HardwareService;
import egovframework.itman.hardware.service.HardwareVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("hardwareService")
public class HardwareServiceImpl implements HardwareService {
    @Resource
    HardwareDAO hardwareDAO;

    @Override
    public HardwareVO selectHardwareView(String assIdx) throws Exception {
        return hardwareDAO.selectHardwareView(assIdx);
    }
}
