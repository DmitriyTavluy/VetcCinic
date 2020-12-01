package com.example.vetclinica.controller;

import com.example.vetclinica.domain.Employee;
import com.example.vetclinica.domain.Novost;
import com.example.vetclinica.domain.User;
import com.example.vetclinica.repos.EmployeeRepos;
import com.example.vetclinica.repos.NovostRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {
    @Autowired
    private EmployeeRepos employeeRepos;

    @Autowired
    private NovostRepos novostRepos;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        Iterable<Novost> novost = novostRepos.findAll();
        model.put("novosts", novost);

        return "greeting";
    }

    @GetMapping("/about")
    public String about(Map<String, Object> model) {

        return "about";
    }

    @PostMapping("/")
    public String add_news(
            @RequestParam String text,
            @RequestParam Date date_post, Model model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        Novost novost = new Novost(text, date_post);
        novostRepos.save(novost);

        Iterable<Novost> novosts = novostRepos.findAll();
        model.addAttribute("novosts", novosts);
        return "greeting";
    }

    @PostMapping("/delete")
    public String deletePrice(@RequestParam("novost_id") Long id) {
        novostRepos.deleteById(id);
        return "redirect:/";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Employee> employees = employeeRepos.findAll();

        if (filter != null && !filter.isEmpty()) {
            employees = employeeRepos.findByPosition(filter);
        } else {
            employees = employeeRepos.findAll();
        }

        model.addAttribute("employees", employees);
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @RequestParam String fio,
            @RequestParam String position,
            @RequestParam String education, Map<String, Object> model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        Employee employee = new Employee(fio, position, education);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            employee.setFilename(resultFilename);
        }

        employeeRepos.save(employee);

        Iterable<Employee> employees = employeeRepos.findAll();

        model.put("employees", employees);

        return "main";
    }

    @PostMapping("/employee/delete")
    public String deleteEmployee(@RequestParam Long id) {
        employeeRepos.deleteById(id);
        return "redirect:/main";
    }

}
