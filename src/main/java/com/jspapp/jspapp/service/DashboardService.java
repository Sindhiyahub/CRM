package com.jspapp.jspapp.service;

import java.util.List;
import java.util.Map;

public interface DashboardService {
    List<Map<String, Object>> getMarketingData();
    List<Map<String, Object>> getLeadsByStatus();
    List<Map<String, Object>> getOpportunitiesByStage();
    List<Map<String, Object>> getOpportunitiesValueByMonth();
    List<Map<String, Object>> getCasesByStatus();
    Map<String, Object> getQuoteApprovalRate();
    List<Map<String, Object>> getRevenueForecast(); 
    int getTotalConvertedLeads();
    int getTotalContacts();
    int getTotalLeads();
    int getTotalOpportunities();
}
