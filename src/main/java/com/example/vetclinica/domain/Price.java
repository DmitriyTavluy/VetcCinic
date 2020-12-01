package com.example.vetclinica.domain;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.List;

@Entity
public class Price {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long price_id;

    private String procedur;
    private Integer cost;

    public Price() {

    }

    public Price(String procedur, Integer cost) {
        this.procedur = procedur;
        this.cost = cost;
    }

    public Long getPrice_id() {
        return price_id;
    }

    public void setPrice_id(Long price_id) {
        this.price_id = price_id;
    }

    public String getProcedur() {
        return procedur;
    }

    public void setProcedur(String procedur) {
        this.procedur = procedur;
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public static String listToString(List<Price> priceList) {
        StringBuilder str = new StringBuilder();
        String tmp;
        int totalPrice = 0;
        for (Price price : priceList) {
            tmp = price.procedur + " " + price.cost + "$\n";
            str.append(tmp);
            totalPrice += price.cost;
        }
        str.append("\tИтоговая сумма: ").append(totalPrice).append("$\n");
        return str.toString();
    }
}
