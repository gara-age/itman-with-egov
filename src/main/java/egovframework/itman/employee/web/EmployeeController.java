package egovframework.itman.employee.web;


import egovframework.itman.asset.service.AssetVO;
import egovframework.itman.asset.service.impl.AssetServiceImpl;
import egovframework.itman.common.Pagination;
import egovframework.itman.division.service.DivisionVO;
import egovframework.itman.division.service.impl.DivisionServiceImpl;
import egovframework.itman.empState.service.EmpStateVO;
import egovframework.itman.employee.service.EmployeeVO;
import egovframework.itman.employee.service.impl.EmployeeServiceImpl;
import egovframework.itman.position.service.PositionVO;
import egovframework.itman.position.service.impl.PositionServiceImpl;
import egovframework.itman.empState.service.impl.EmpStateServiceImpl;
import egovframework.itman.state.service.StateVO;
import egovframework.itman.state.service.impl.StateServiceImpl;
import egovframework.usr.com.EgovframeworkCommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class EmployeeController {
    @Resource(name = "employeeService")
    private EmployeeServiceImpl employeeService;
    @Resource(name = "divisionService")
    private DivisionServiceImpl divisionService;
    @Resource(name = "empStateService")
    private EmpStateServiceImpl empStateService;
    @Resource(name = "positionService")
    private PositionServiceImpl positionService;
    @Resource(name = "assetService")
    private AssetServiceImpl assetService;

    private void addCommonLists(String groIdx, Model model) {
        model.addAttribute("divisionList", divisionService.selectDivisionsByGroup(groIdx));
        model.addAttribute("empStateList", empStateService.selectEmpStatesByGroup(groIdx));
        model.addAttribute("positionList", positionService.selectPositionsByGroup(groIdx));
    }
    // --------------------조회--------------------

    @RequestMapping("/itman/employeeList.do")
    public String selectEmployeeList(EmployeeVO vo, Pagination pagination, Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
                                     , HttpSession session
                                     ,@RequestParam(value = "id", defaultValue = "2")int id
    ) throws Exception {
        model.addAttribute("pageNumDepth01", id);
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = employeeService.selectEmployeeListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        //그룹별 부서, 상태, 직위 조회
        addCommonLists(groIdx, model);
        pagination.setSearching(pagination.getSearching());
        //검색 결과에 따른 총 목록의 길이를 반환
        List<EmployeeVO> list = employeeService.selectEmployeeList(pagination);
        //페이징 구현
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);
        return "itman/public/html/ingroup/emploList";
    }


    @RequestMapping("/itman/employeeView.do")
    public String selectEmployeeView(EmployeeVO vo, Model model, Pagination pagination, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);
        EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
        List<AssetVO> assetList = assetService.selectEmpAssetList(resultVO);
        model.addAttribute("employee", resultVO);
        model.addAttribute("assetList", assetList);
        return "itman/public/html/ingroup/emploView";
    }

    // ---------------------생성--------------------------

    @RequestMapping("/itman/employeeWrite.do")
    public String employeeForm(EmployeeVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");

        addCommonLists(groIdx, model);
        return "itman/public/html/ingroup/emploWrite";
    }

    @RequestMapping("/itman/emploDivisionWrite.do")
    public String writeEmployeeDivision(DivisionVO vo, Model model) {
        model.addAttribute("division", vo);
        return "itman/public/html/popup/employee/emploDivisionWrite";
    }

    @PostMapping("/itman/insertEmploDivision.do")
    public String insertEmployeeDivision(DivisionVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        divisionService.insertDivision(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "부서가 추가되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/emploPositionWrite.do")
    public String writeEmployeePosition(PositionVO vo, Model model) {
        model.addAttribute("position", vo);
        return "itman/public/html/popup/employee/emploPositionWrite";
    }

    @PostMapping(value = "/itman/checkDuplicateEmpPos.do" ,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String checkDuplicateEmpPos(@RequestParam("posCode") String posCode, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        PositionVO vo = new PositionVO();
        vo.setPosCode(posCode);
        vo.setGroIdx(groIdx);
        PositionVO resultVO = positionService.checkDuplicate(vo);
        if (resultVO != null){
            return "0";
        }
        return "1";
    }
    @PostMapping("/itman/insertEmploPosition.do")
    public String insertEmployeePosition(PositionVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        positionService.insertPosition(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직위가 추가되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/emploStateWrite.do")
    public String writeEmployeeState(EmpStateVO vo, Model model) {
        model.addAttribute("empState", vo);
        return "itman/public/html/popup/employee/emploStateWrite";
    }

    @PostMapping(value = "/itman/checkDuplicateEmpSta.do" ,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String checkDuplicateEmpSta(@RequestParam("empStCode") String empStCode, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        EmpStateVO vo = new EmpStateVO();
        vo.setEmpStCode(empStCode);
        vo.setGroIdx(groIdx);
        EmpStateVO resultVO = empStateService.checkDuplicate(vo);
        if (resultVO != null){
            return "0";
        }
        return "1";
    }
    @PostMapping("/itman/insertEmploState.do")
    public String insertEmployeeState(EmpStateVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        empStateService.insertEmployeeState(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원 상태가 추가되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    // --------------------수정----------------------------

    @RequestMapping("/itman/emploTellInfoEdit.do")
    public String employeeTelEdit(EmployeeVO vo, Model model) {
        EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
        model.addAttribute("employee", resultVO);

        return "itman/public/html/popup/employee/emploTelInfoEdit";
    }

    @RequestMapping("/itman/updateEmploTelInfo.do")
    public String updateEmploTelInfo(EmployeeVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        employeeService.updateEmploTelInfo(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원 연락처가 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/emploDivisionInfoEdit.do")
    public String employeeDivisionEdit(EmployeeVO vo, Model model) {
            EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
            model.addAttribute("employee", resultVO);
            String groIdx = resultVO.getGroIdx();
        model.addAttribute("divisionList", divisionService.selectDivisionsByGroup(groIdx));

        return "itman/public/html/popup/employee/emploDivisionInfoEdit";
    }
    @RequestMapping("/itman/updateEmploDivisionInfo.do")
    public String updateEmploDivisionInfo(EmployeeVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        employeeService.updateEmploDivisionInfo(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원 부서가 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/emploPosInfoEdit.do")
    public String employeePosEdit(EmployeeVO vo, Model model) {
        EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
        model.addAttribute("employee", resultVO);
        String groIdx = resultVO.getGroIdx();

        model.addAttribute("positionList", positionService.selectPositionsByGroup(groIdx));


        return "itman/public/html/popup/employee/emploPosInfoEdit";
    }
    @RequestMapping("/itman/updateEmploPosInfo.do")
    public String updateEmploPosInfo(EmployeeVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        employeeService.updateEmploPosInfo(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원 직위가 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/emploMailInfoEdit.do")
    public String employeeMailEdit(EmployeeVO vo, Model model) {
        EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
        model.addAttribute("employee", resultVO);

        return "itman/public/html/popup/employee/emploMailInfoEdit";
    }

    @RequestMapping("/itman/updateEmploMailInfo.do")
    public String updateEmploMailInfo(EmployeeVO vo, Model model , HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);

        employeeService.updateEmploMailInfo(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원 메일이 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/emploNameInfoEdit.do")
    public String employeeNameEdit(EmployeeVO vo, Model model) {
        EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
        model.addAttribute("employee", resultVO);

        return "itman/public/html/popup/employee/emploNameInfoEdit";
    }

    @RequestMapping("/itman/updateEmploNameInfo.do")
    public String updateEmploNameInfo(EmployeeVO vo, Model model ) {
        employeeService.updateEmploNameInfo(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원명이 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/emploStateInfoEdit.do")
    public String employeeStateEdit(EmployeeVO vo, Model model) {
            EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
            model.addAttribute("employee", resultVO);
            String groIdx = resultVO.getGroIdx();

        model.addAttribute("empStateList", empStateService.selectEmpStatesByGroup(groIdx));

        return "itman/public/html/popup/employee/emploStateInfoEdit";
    }

    @RequestMapping("/itman/updateEmploStateInfo.do")
    public String updateEmploStateInfo(EmployeeVO vo, Model model , HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        employeeService.updateEmploStateInfo(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원 상태가 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/emploNumInfoEdit.do")
    public String employeeNumEdit(EmployeeVO vo, Model model) {
            EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
            model.addAttribute("employee", resultVO);

        return "itman/public/html/popup/employee/emploNumInfoEdit";
    }

    @RequestMapping("/itman/updateEmploNumInfo.do")
    public String updateEmploNumInfo(EmployeeVO vo, Model model , HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        employeeService.updateEmploNumInfo(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원 사번이 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/insert.do")
    public String insertEmployee(EmployeeVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        employeeService.insertEmployee(vo);
        return EgovframeworkCommonUtil.alertMove(model, "직원이 추가되었습니다", "/itman/employeeList.do");
    }

    @RequestMapping("/itman/emploDelConfirm.do")
    public String deleteEmploConfirm(EmployeeVO vo, Model model) {
        EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
        model.addAttribute("employee", resultVO);
        return "itman/public/html/popup/employee/emploDel";
    }

    @RequestMapping("/itman/emploDel.do")
    public String deleteEmployee(EmployeeVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String delIdx = (String) session.getAttribute("userIdx");
        vo.setDelIdx(delIdx);
        employeeService.deleteEmployee(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원이 삭제되었습니다","<script>window.opener.location='/itman/employeeList.do'; window.close();</script>");
    }

    @RequestMapping("/itman/popup/searchPop.do")
    public String searchPop(EmployeeVO vo, Pagination pagination, Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
            , HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = employeeService.selectEmployeeListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        pagination.setSearching(pagination.getSearching());
        //검색 결과에 따른 총 목록의 길이를 반환
        List<EmployeeVO> list = employeeService.selectEmployeeList(pagination);
        //페이징 구현
        model.addAttribute("pagination", pagination);
        model.addAttribute("employeeList", list);
        return "itman/public/html/popup/searchPop";
    }


}
