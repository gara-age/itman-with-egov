package egovframework.itman.position.service.impl;

import egovframework.itman.position.service.PositionService;
import egovframework.itman.position.service.PositionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("positionService")
public class PositionServiceImpl implements PositionService {
    @Autowired
    private PositionDAO positionDAO;

    @Override
    public List<PositionVO> selectPositionsByGroup(String groIdx) {

        return positionDAO.selectPositionsByGroup(groIdx);
    }
}
