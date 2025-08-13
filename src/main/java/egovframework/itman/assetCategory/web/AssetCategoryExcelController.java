package egovframework.itman.assetCategory.web;

import egovframework.itman.assetCategory.service.AssetCategoryVO;
import egovframework.itman.assetCategory.service.impl.AssetCategoryServiceImpl;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AssetCategoryExcelController {
    @Resource(name = "assetCategoryService")
    private AssetCategoryServiceImpl assetCategoryService;

    @GetMapping("/itman/downloadAssetCategoryData.do")
    public void downloadAssetCategoryData(HttpServletResponse response, String groIdx, HttpSession session) throws Exception {
        //xls 버전
        groIdx = (String) session.getAttribute("groIdx");

        Workbook workbook = new HSSFWorkbook(); //엑셀파일 생성
        Sheet sheet = workbook.createSheet("Asset_Category_Data"); //하나의 sheet 생성
        int rowNo = 0;

        CellStyle headStyle = workbook.createCellStyle();
        headStyle.setBorderBottom(BorderStyle.THIN);
        headStyle.setBorderLeft(BorderStyle.THIN);
        headStyle.setBorderRight(BorderStyle.THIN);
        headStyle.setBorderTop(BorderStyle.THIN);
        headStyle.setAlignment(HorizontalAlignment.CENTER);
        Font font = workbook.createFont();
        font.setBold(true);
        headStyle.setFont(font);

        sheet.setColumnWidth(0, 3300);
        sheet.setColumnWidth(1, 3300);
        sheet.setColumnWidth(2, 3000);

        Row headerRow = sheet.createRow(rowNo++);
        headerRow.createCell(0).setCellValue("자산 분류 코드");
        headerRow.createCell(1).setCellValue("자산 분류명");
        headerRow.createCell(2).setCellValue("비고");
        for(int i = 0; i < 3; i++){
            headerRow.getCell(i).setCellStyle(headStyle);
        }

        CellStyle rowStyle = workbook.createCellStyle();
        rowStyle.setBorderBottom(BorderStyle.THIN);
        rowStyle.setBorderLeft(BorderStyle.THIN);
        rowStyle.setBorderRight(BorderStyle.THIN);
        rowStyle.setBorderTop(BorderStyle.THIN);
        rowStyle.setAlignment(HorizontalAlignment.CENTER);

        List<AssetCategoryVO> list = assetCategoryService.findAll(groIdx);

        for (AssetCategoryVO assetCategoryVO : list) {
            Row row = sheet.createRow(rowNo++);

            row.createCell(0).setCellValue(assetCategoryVO.getAssCatCode());
            row.getCell(0).setCellStyle(rowStyle);
            row.createCell(1).setCellValue(assetCategoryVO.getAssCatName());
            row.getCell(1).setCellStyle(rowStyle);
            row.createCell(2).setCellValue(assetCategoryVO.getSlNote());
            row.getCell(2).setCellStyle(rowStyle);

        }

        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment; filename=Asset-Category-List.xls");

        workbook.write(response.getOutputStream());
        workbook.close();
    }
}
