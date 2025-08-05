package egovframework.itman.software.service;

import java.util.List;

public interface SoftwareService {
    List<SoftwareVO> selectSoftwareList(String assIdx) throws Exception;
}
