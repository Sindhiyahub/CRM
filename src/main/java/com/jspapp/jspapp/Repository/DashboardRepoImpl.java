package com.jspapp.jspapp.Repository;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardRepoImpl implements DashboardRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> getMarketingData() {
        String sql = "SELECT campaignType, COUNT(*) AS count FROM campaigns GROUP BY campaignType";
        return jdbcTemplate.queryForList(sql);
    }
    @Override
    public List<Map<String, Object>> getLeadsByStatus() {
        String sql = "SELECT status, COUNT(*) AS count FROM leads GROUP BY status";
        return jdbcTemplate.queryForList(sql);
    }
    
    @Override
    public List<Map<String, Object>> getOpportunitiesByStage() {
        String sql = "SELECT stage, COUNT(*) as count FROM opportunity GROUP BY stage";
        return jdbcTemplate.queryForList(sql);
    }
    @Override
    public List<Map<String, Object>> getOpportunitiesValueByMonth() {
        String sql = "SELECT DATE_FORMAT(closingDate, '%b %Y') AS month, " +
                     "SUM(value) AS totalValue " +
                     "FROM opportunity " +
                     "WHERE closingDate IS NOT NULL " +
                     "GROUP BY DATE_FORMAT(closingDate, '%b %Y') " +
                     "ORDER BY MIN(closingDate)";

        return jdbcTemplate.queryForList(sql);
    }

    @Override
    public List<Map<String, Object>> getCasesByStatus() {
        String sql = "SELECT status, COUNT(*) AS count FROM cases GROUP BY status";
        return jdbcTemplate.queryForList(sql);
    }

    @Override
    public Map<String, Object> getQuoteApprovalRate() {
        String sql = "SELECT " +
                     "SUM(CASE WHEN status = 'Approved' THEN 1 ELSE 0 END) AS approved, " +
                     "SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) AS pending " +
                     "FROM quotes";
        return jdbcTemplate.queryForMap(sql);
    }

    @Override
    public List<Map<String, Object>> getRevenueForecast() {
        String sql = "SELECT DATE_FORMAT(closingDate, '%b %Y') AS month, " + 
                     "SUM(value) AS revenue " + 
                     "FROM opportunity " + 
                     "WHERE closingDate IS NOT NULL " + 
                     "GROUP BY DATE_FORMAT(closingDate, '%b %Y') " + 
                     "ORDER BY MIN(closingDate)";
        return jdbcTemplate.queryForList(sql);
    }

    @Override
    public int getTotalConvertedLeads() {
        String sql = "SELECT COUNT(*) FROM opportunity";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }


    @Override
    public int getTotalContacts() {
        String sql = "SELECT COUNT(*) FROM contact";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    @Override
    public int getTotalLeads() {
        String sql = "SELECT COUNT(*) FROM leads";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    @Override
    public int getTotalOpportunities() {
        String sql = "SELECT COUNT(*) FROM opportunity";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
    
    
}
