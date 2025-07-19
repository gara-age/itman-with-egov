package egovframework.itman.division.service;

import java.util.List;

public interface DivisionService {
    List<DivisionVO> selectDivisionsByGroup(String groIdx);
}