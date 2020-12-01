package com.example.vetclinica.controller;


import com.example.vetclinica.domain.Price;
import com.example.vetclinica.repos.PriceRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Controller
public class PriceController {
    @Autowired
    private PriceRepos priceRepos;


    @GetMapping("/price")
    public String Price(Map<String, Object> model) {
        Iterable<Price> prices = priceRepos.findAll();



        model.put("prices", prices);

        return "price";
    }

    @PostMapping("/price")
    public String add_price(
            @RequestParam String procedure,
            @RequestParam Integer cost, Map<String, Object> model
    ) throws IOException {
        Price price = new Price(procedure, cost);
        priceRepos.save(price);

        Iterable<Price> prices = priceRepos.findAll();
        model.put("prices", prices);

        return "price";
    }

    @PostMapping("/price/delete")
    public String deletePrice(@RequestParam("price_id") Long id) {
        priceRepos.deleteById(id);
        return "redirect:/price";
    }
}