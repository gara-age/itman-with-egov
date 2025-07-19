package egovframework.itman.position.service;

import java.util.List;

public interface PositionService {
    List<PositionVO> selectPositionsByGroup(String groIdx);

}
