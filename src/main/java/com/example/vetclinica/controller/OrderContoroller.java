package com.example.vetclinica.controller;

import com.example.vetclinica.domain.Employee;
import com.example.vetclinica.domain.Order;
import com.example.vetclinica.domain.Price;
import com.example.vetclinica.domain.User;
import com.example.vetclinica.repos.EmployeeRepos;
import com.example.vetclinica.repos.OrderRepos;
import com.example.vetclinica.repos.PriceRepos;
import com.example.vetclinica.repos.UserRepos;
import com.example.vetclinica.service.MailSender;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class OrderContoroller {

    private final EmployeeRepos employeeRepos;
    private final UserRepos userRepos;
    private final PriceRepos priceRepos;
    private final OrderRepos orderRepos;
    private final MailSender mailSender;

    @Autowired
    public OrderContoroller(EmployeeRepos employeeRepos, UserRepos userRepos, PriceRepos priceRepos, OrderRepos orderRepos, MailSender mailSender) {
        this.employeeRepos = employeeRepos;
        this.userRepos = userRepos;
        this.priceRepos = priceRepos;
        this.orderRepos = orderRepos;
        this.mailSender = mailSender;
    }

    @GetMapping("/order")
    public String order(@RequestParam("userId") Long id, Map<String, Object> model) {
        User user = userRepos.findById(id).get();
        Iterable<Employee> employees = employeeRepos.findAll();
        Iterable<Price> prices = priceRepos.findAll();
        List<Order> orders = orderRepos.findByUserId_Id(id);
        model.put("employees", employees);
        model.put("user", user);
        model.put("prices", prices);
        model.put("orders", orders);
        orders.forEach(order -> order.setTotalCost(order.getServices().stream().mapToInt(Price::getCost).sum()));
        return "order";
    }

    @PostMapping("/order")
    public String addOrder(@RequestParam Long userId, @RequestParam("employee") Long employeeId, @RequestParam List<Long> services, @RequestParam String time) {
        User user = userRepos.findById(userId).get();
        List<Price> prices = (List<Price>) priceRepos.findAllById(services);
        Employee employee = employeeRepos.findById(employeeId).get();
        Order order = new Order(time, user, employee, prices);
        orderRepos.save(order);
        if (user.getEmail() != null) {
            String message = String.format(
                    "Ваш заказ принят. Вас принимает %s %s\n" +
                            "Услуги: %s",
                    employee.getFio(),
                    time,
                    Price.listToString(prices)
            );
            mailSender.send(user.getEmail(), "New Order", message);
        }
        return "redirect:/order?userId=" + userId;
    }

    @PostMapping("/order/delete")
    public String deleteOrder(@RequestParam("id") Long id, @RequestParam("userId") Long userId) {
        orderRepos.deleteById(id);
        return "redirect:/order?userId=" + userId;
    }

}
