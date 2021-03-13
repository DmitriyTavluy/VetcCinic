package com.example.vetclinica.controller;

import com.example.vetclinica.domain.Employee;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EmployeeExlImporter {
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<Employee> orders;

    public EmployeeExlImporter(List<Employee> orders) {
        this.orders = orders;
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet("Employees");

    }

    private void writeHeaderRow(){
        Row row = sheet.createRow(0);
        Cell cell = row.createCell(0);
        cell.setCellValue("Employee ID");
        Cell cell1 = row.createCell(1);
        cell1.setCellValue("FIO");
        Cell cell2 = row.createCell(2);
        cell2.setCellValue("Position");
        Cell cell3 = row.createCell(3);
        cell3.setCellValue("Education");

    }
    private void writeDataRows(){
        int rowsCount = 2;
        for (Employee order : orders){
            Row row = sheet.createRow(rowsCount);
            Cell cell = row.createCell(0);
            cell.setCellValue(order.getEmployee_id());
            Cell cell1 = row.createCell(1);
            cell1.setCellValue(order.getFio());
            Cell cell2 = row.createCell(2);
            cell2.setCellValue(order.getPosition());
            Cell cell3 = row.createCell(3);
            cell3.setCellValue(order.getEducation());


        }
    }
    public void export(HttpServletResponse response) throws IOException {
        writeHeaderRow();
        writeDataRows();

        ServletOutputStream servletOutputStream = response.getOutputStream();
        workbook.write(servletOutputStream);
        workbook.close();
        servletOutputStream.close();
    }






}
