package com.jspapp.jspapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jspapp.jspapp.service.DashboardService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@Controller
@RequestMapping("/dashboard") 
public class DashboardController {

	private static final Logger logger = LogManager.getLogger(DashboardController.class);

	@Autowired
	private DashboardService dashboardService;

	@GetMapping("") // Maps to "/dashboard"
	public String showDashboard(Model model) {
		return "dashboard";
	}

	@GetMapping("/totals") 
	@ResponseBody
	public Map<String, Integer> getTotals() {
		Map<String, Integer> totals = new HashMap<>();
		try {
			totals.put("totalContacts", dashboardService.getTotalContacts());
			totals.put("totalLeads", dashboardService.getTotalLeads());
			totals.put("totalOpportunities", dashboardService.getTotalOpportunities());
			logger.info("Total counts fetched successfully.");
		} catch (Exception e) {
			logger.error("Error fetching totals: ", e);
		}
		return totals;
	}

	@GetMapping("/marketing")
	@ResponseBody
	public List<Map<String, Object>> getMarketingData() {
		try {
			List<Map<String, Object>> marketingData = dashboardService.getMarketingData();
			logger.info("Marketing data fetched successfully.");
			return marketingData;
		} catch (Exception e) {
			logger.error("Error fetching marketing data: ", e);
			return null;
		}
	}

	@GetMapping("/leads")
	@ResponseBody
	public List<Map<String, Object>> getLeadsByStatus() {
		try {
			return dashboardService.getLeadsByStatus();
		} catch (Exception e) {
			logger.error("Error fetching leads data by status:", e);
			return null;
		}
	}

	@GetMapping("/opportunities")
	@ResponseBody
	public List<Map<String, Object>> getOpportunitiesByStage() {
		try {
			return dashboardService.getOpportunitiesByStage();
		} catch (Exception e) {
			logger.error("Error fetching opportunities by stage:", e);
			return null;
		}
	}

	@GetMapping("/leadConversionRate")
	@ResponseBody
	public Map<String, Object> getLeadConversionRate() {
		Map<String, Object> conversionRateData = new HashMap<>();
		try {
			int totalLeads = dashboardService.getTotalLeads();
			int convertedLeads = dashboardService.getTotalConvertedLeads();

			double conversionRate = (totalLeads > 0) ? ((double) convertedLeads / totalLeads) * 100 : 0;

			conversionRateData.put("totalLeads", totalLeads);
			conversionRateData.put("convertedLeads", convertedLeads);
			conversionRateData.put("conversionRate", conversionRate);

		} catch (Exception e) {
			logger.error("Error fetching lead conversion rate: ", e);
		}
		return conversionRateData;
	}

	@GetMapping("/opportunitiesValueByMonth")
	@ResponseBody
	public List<Map<String, Object>> getOpportunitiesValueByMonth() {
		return dashboardService.getOpportunitiesValueByMonth();
	}

	  @GetMapping("/casesByStatus")
	    @ResponseBody
	    public List<Map<String, Object>> getCasesByStatus() {
	        try {
	            logger.info("Fetching case status counts.");
	            return dashboardService.getCasesByStatus();
	        } catch (Exception e) {
	            logger.error("Error fetching cases by status: ", e);
	            return null;
	        }
	    }
	  @GetMapping("/quoteApprovalRate")
	    @ResponseBody
	    public Map<String, Object> getQuoteApprovalRate() {
	        return dashboardService.getQuoteApprovalRate();
	    }


	    @GetMapping("/revenueForecast")
	    @ResponseBody
	    public List<Map<String, Object>> getRevenueForecast() {
	        return dashboardService.getRevenueForecast();
	    }
}
