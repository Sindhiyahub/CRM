package com.jspapp.jspapp.service;

import java.util.List;
import java.util.Map;

public interface ReportsService {
    List<Map<String, Object>> getSalesData();
    List<Map<String, Object>> getCustomerData();
}
