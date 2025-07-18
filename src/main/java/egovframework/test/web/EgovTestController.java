package egovframework.test.web;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.test.service.EgovTestService;

@Controller
public class EgovTestController {

    @Autowired
    private EgovTestService egovTestService;

    @RequestMapping(value = "/test.do")
    public String test(Model model) throws Exception {
        // 서비스 호출

        List<EgovMap> testList = null;
        try {
            testList = egovTestService.selectTestList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // sysout 찍기
        for (EgovMap row : testList) {
        	System.out.println("row = " + row);
            System.out.println("Column1 = " + row.get("column1"));
            System.out.println("Column2 = " + row.get("column2"));
        }

        // 모델에도 담아서 화면에 전달
        model.addAttribute("testList", testList);

        return "/test/test";
    }
}
