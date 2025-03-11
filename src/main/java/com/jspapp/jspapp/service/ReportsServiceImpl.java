package com.jspapp.jspapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jspapp.jspapp.Repository.ReportsRepo;

@Service
public class ReportsServiceImpl implements ReportsService {

    @Autowired
    private ReportsRepo reportsRepo;

    @Override
    public List<Map<String, Object>> getSalesData() {
        return reportsRepo.getSalesData();
    }

    @Override
    public List<Map<String, Object>> getCustomerData() {
        return reportsRepo.getCustomerData();
    }
}
