package com.jspapp.jspapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspapp.jspapp.Repository.DashboardRepo;
import com.jspapp.jspapp.service.DashboardService;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	private DashboardRepo dashboardRepo;

	@Override
	public List<Map<String, Object>> getMarketingData() {
		return dashboardRepo.getMarketingData();
	}

	@Override
	public List<Map<String, Object>> getLeadsByStatus() {
		return dashboardRepo.getLeadsByStatus();
	}

	@Override
	public List<Map<String, Object>> getOpportunitiesByStage() {
		return dashboardRepo.getOpportunitiesByStage();
	}

	@Override
	public List<Map<String, Object>> getOpportunitiesValueByMonth() {
		return dashboardRepo.getOpportunitiesValueByMonth();
	}

	@Override
	public List<Map<String, Object>> getCasesByStatus() {
		return dashboardRepo.getCasesByStatus();
	}

	@Override
	public Map<String, Object> getQuoteApprovalRate() {
		return dashboardRepo.getQuoteApprovalRate();
	}


	@Override
	public List<Map<String, Object>> getRevenueForecast() {
		return dashboardRepo.getRevenueForecast();
	}

	@Override
	public int getTotalConvertedLeads() {
		return dashboardRepo.getTotalConvertedLeads();
	}

	@Override
	public int getTotalContacts() {
		return dashboardRepo.getTotalContacts();
	}

	@Override
	public int getTotalLeads() {
		return dashboardRepo.getTotalLeads();
	}

	@Override
	public int getTotalOpportunities() {
		return dashboardRepo.getTotalOpportunities();
	}

}
