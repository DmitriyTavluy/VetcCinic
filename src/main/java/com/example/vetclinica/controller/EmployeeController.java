package com.example.vetclinica.controller;

import com.example.vetclinica.domain.Employee;
import com.example.vetclinica.repos.EmployeeRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeRepos employeeRepos;

    @GetMapping("/o/export")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");

        String headerkey = "Content-Disposition";
        String headerValue = "attachement; filename=orders.xls";

        response.setHeader(headerkey, headerValue);

        List<Employee> list = (List<Employee>) employeeRepos.findAll();

        EmployeeExlImporter excelExporter = new EmployeeExlImporter(list);
        excelExporter.export(response);
    }

}
