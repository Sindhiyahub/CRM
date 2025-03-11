package com.jspapp.jspapp.Repository;

import com.jspapp.jspapp.dto.Opportunity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class OpportunityRepoImpl implements OpportunityRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

 
    private Opportunity mapRowToOpportunity(ResultSet rs, int rowNum) throws SQLException {
        Opportunity opportunity = new Opportunity();
        opportunity.setId(rs.getInt("id"));
        opportunity.setValue(rs.getDouble("value"));
        opportunity.setName(rs.getString("name"));
        opportunity.setAccountId(rs.getInt("accountId"));
        opportunity.setStage(rs.getString("stage"));
        opportunity.setClosingDate(rs.getDate("closingDate"));
        opportunity.setProbability(rs.getDouble("probability"));
        opportunity.setAssignedTo(rs.getInt("assignedTo"));
        opportunity.setCreatedAt(rs.getInt("createdAt"));
        return opportunity;
    }

    @Override
    public List<Opportunity> getAllOpportunities() {
        String sql = "SELECT * FROM opportunity";
        return jdbcTemplate.query(sql, this::mapRowToOpportunity);
    }

    @Override
    public void addOpportunity(Opportunity opportunity) {
        String sql = "INSERT INTO opportunity (value, name, accountId, stage, closingDate, probability, assignedTo, createdAt) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, opportunity.getValue(), opportunity.getName(), opportunity.getAccountId(), opportunity.getStage(),
                opportunity.getClosingDate(), opportunity.getProbability(), opportunity.getAssignedTo(), opportunity.getCreatedAt());
    }

    @Override
    public void deleteOpportunity(int id) {
        String sql = "DELETE FROM opportunity WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public void updateOpportunity(Opportunity opportunity) {
        String sql = "UPDATE opportunity SET value=?, name=?, accountId=?, stage=?, closingDate=?, probability=?, assignedTo=?, createdAt=? WHERE id=?";
        jdbcTemplate.update(sql, opportunity.getValue(), opportunity.getName(), opportunity.getAccountId(), opportunity.getStage(),
                opportunity.getClosingDate(), opportunity.getProbability(), opportunity.getAssignedTo(), opportunity.getCreatedAt(), opportunity.getId());
    }
    @Override
    public Opportunity getOpportunityById(int id) {
        String sql = "SELECT * FROM opportunity WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, this::mapRowToOpportunity);
    }
    
   
    

}

