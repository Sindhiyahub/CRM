package com.jspapp.jspapp.Repository;

import java.util.List;
import java.util.Map;

public interface ReportsRepo {
    List<Map<String, Object>> getSalesData();
    List<Map<String, Object>> getCustomerData();
    
}
