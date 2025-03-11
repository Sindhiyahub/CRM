package com.jspapp.jspapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jspapp.jspapp.service.ReportsService;

@Controller
@RequestMapping("/reports")
public class ReportsController {

    @Autowired
    private ReportsService reportsService;

    @GetMapping
    public String showReportsPage(Model model) {
        List<Map<String, Object>> salesData = reportsService.getSalesData();
        List<Map<String, Object>> customerData = reportsService.getCustomerData();
        model.addAttribute("salesData", salesData);
        model.addAttribute("customerData", customerData);
        return "reports";
    }
}
