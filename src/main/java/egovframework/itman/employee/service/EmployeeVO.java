package egovframework.itman.employee.service;

import egovframework.itman.common.Searching;

public class EmployeeVO extends Searching {

    private String empIdx; // 직원IDX
    private String groIdx; // 소속그룹IDX
    private String empNum; // 사번
    private String empName; // 직원이름
    private String empMail; // 직원이메일
    private String empTel; // 직원휴대폰
    private String divIdx; // 소속부서IDX
    private String posIdx; // 직위IDX
    private String empStIdx; // 직원상태IDX
    private String regDate; // 생성일시
    private String regIdx; // 생성자IDX
    private String modDate; // 수정일시
    private String modIdx; // 수정자IDX
    private String delYn; // 삭제여부
    private String delIdx; // 삭제자IDX
    private String delDate; // 삭제일시
    private String empDiv;
    private String posName;
    public String empState;

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    public String getEmpState() {return empState; }

    public void setEmpState(String empState) { this.empState = empState; }

    public String getPosName() {
        return posName;
    }

    public void setPosName(String posName) {
        this.posName = posName;
    }

    public String getEmpDiv() {
        return empDiv;
    }

    public void setEmpDiv(String empDiv) {
        this.empDiv = empDiv;
    }

    public String getEmpIdx() {
        return empIdx;
    }

    public void setEmpIdx(String empIdx) {
        this.empIdx = empIdx;
    }

    public String getGroIdx() {
        return groIdx;
    }

    public void setGroIdx(String groIdx) {
        this.groIdx = groIdx;
    }

    public String getEmpNum() {
        return empNum;
    }

    public void setEmpNum(String empNum) {
        this.empNum = empNum;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpMail() {
        return empMail;
    }

    public void setEmpMail(String empMail) {
        this.empMail = empMail;
    }

    public String getEmpTel() {
        return empTel;
    }

    public void setEmpTel(String empTel) {
        this.empTel = empTel;
    }

    public String getDivIdx() {
        return divIdx;
    }

    public void setDivIdx(String divIdx) {
        this.divIdx = divIdx;
    }

    public String getPosIdx() {
        return posIdx;
    }

    public void setPosIdx(String posIdx) {
        this.posIdx = posIdx;
    }

    public String getEmpStIdx() {
        return empStIdx;
    }

    public void setEmpStIdx(String empStIdx) {
        this.empStIdx = empStIdx;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getRegIdx() {
        return regIdx;
    }

    public void setRegIdx(String regIdx) {
        this.regIdx = regIdx;
    }

    public String getModDate() {
        return modDate;
    }

    public void setModDate(String modDate) {
        this.modDate = modDate;
    }

    public String getModIdx() {
        return modIdx;
    }

    public void setModIdx(String modIdx) {
        this.modIdx = modIdx;
    }

    public String getIsDeleted() {
        return delYn;
    }

    public void setIsDeleted(String isDeleted) {
        this.delYn = isDeleted;
    }

    public String getDelIdx() {
        return delIdx;
    }

    public void setDelIdx(String delIdx) {
        this.delIdx = delIdx;
    }

    public String getDelDate() {
        return delDate;
    }

    public void setDelDate(String delDate) {
        this.delDate = delDate;
    }

}
