package com.jspapp.jspapp.Repository;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import com.jspapp.jspapp.dto.Lead;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LeadRepoImpl implements LeadRepo {
    private static final Logger logger = LogManager.getLogger(LeadRepoImpl.class);  // Logger instance


    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Lead> getAllLeads() {
    	 logger.info("Fetching all leads...");
        String sql = "SELECT * FROM leads";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Lead.class));
    }

    @Override
    public Lead getLeadById(int leadId) {
        String sql = "SELECT * FROM leads WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Lead.class), leadId);
    }

    @Override
    public boolean updateLead(Lead lead) {
        String sql = "UPDATE leads SET name=?, email=?, phone=?, company=?, source=?, status=?, industry=?, title=?, assignedTo=? WHERE id=?";
        int rowsAffected = jdbcTemplate.update(sql, lead.getName(), lead.getEmail(), lead.getPhone(), lead.getCompany(), lead.getSource(), lead.getStatus(), lead.getIndustry(), lead.getTitle(), lead.getAssignedTo(), lead.getId());
        return rowsAffected > 0;
    }
    
    @Override
    public List<Lead> getLeadsByStatus(String status) {
        String sql = "SELECT * FROM leads WHERE status = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Lead.class), status);
    }
    
    @Override
    public int addLead(Lead lead) {
        String sql = "INSERT INTO leads (name, email, phone, company, source, status, industry, title, assignedTo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, lead.getName(), lead.getEmail(), lead.getPhone(), lead.getCompany(), lead.getSource(), lead.getStatus(),lead.getIndustry(),lead.getTitle(),lead.getAssignedTo());
    }

    @Override
    public boolean updateLeadStatus(int leadId, String status) {
        String sql = "UPDATE leads SET status = ? WHERE id = ?";
        int rowsAffected = jdbcTemplate.update(sql, status, leadId);
        return rowsAffected > 0;
    }

    @Override
    public boolean deleteLead(int leadId) {
        String sql = "DELETE FROM leads WHERE id = ?";
        int rowsAffected = jdbcTemplate.update(sql, leadId);
        return rowsAffected > 0;
    }
}
