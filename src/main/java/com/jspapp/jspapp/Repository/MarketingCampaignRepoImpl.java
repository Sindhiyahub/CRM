package com.jspapp.jspapp.Repository;

import com.jspapp.jspapp.dto.MarketingCampaign;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class MarketingCampaignRepoImpl implements MarketingCampaignRepo {

    private final JdbcTemplate jdbcTemplate;

    public MarketingCampaignRepoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void addCampaign(MarketingCampaign campaign) {
        String sql = "INSERT INTO campaigns (name, description, startDate, endDate, budget, status, createdBy, campaignType) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, campaign.getName(), campaign.getDescription(), campaign.getStartDate(),
                campaign.getEndDate(), campaign.getBudget(), campaign.getStatus(), campaign.getCreatedBy(), campaign.getCampaignType());
    }

    @Override
    public List<MarketingCampaign> getAllCampaigns() {
        String sql = "SELECT * FROM campaigns";
        return jdbcTemplate.query(sql, new CampaignRowMapper());
    }

    @Override
    public MarketingCampaign getCampaignById(int id) {
        String sql = "SELECT * FROM campaigns WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new CampaignRowMapper(), id);
    }

    @Override
    public void updateCampaign(MarketingCampaign campaign) {
        String sql = "UPDATE campaigns SET name=?, description=?, startDate=?, endDate=?, budget=?, status=?, createdBy=?, campaignType=? WHERE id=?";
        jdbcTemplate.update(sql, campaign.getName(), campaign.getDescription(), campaign.getStartDate(),
                campaign.getEndDate(), campaign.getBudget(), campaign.getStatus(), campaign.getCreatedBy(), campaign.getCampaignType(), campaign.getId());
    }

    @Override
    public void deleteCampaign(int id) {
        String sql = "DELETE FROM campaigns WHERE id=?";
        jdbcTemplate.update(sql, id);
    }

    
    private static class CampaignRowMapper implements RowMapper<MarketingCampaign> {
        @Override
        public MarketingCampaign mapRow(ResultSet rs, int rowNum) throws SQLException {
            MarketingCampaign campaign = new MarketingCampaign();
            campaign.setId(rs.getInt("id"));
            campaign.setName(rs.getString("name"));
            campaign.setDescription(rs.getString("description"));
            campaign.setStartDate(rs.getString("startDate"));
            campaign.setEndDate(rs.getString("endDate"));
            campaign.setBudget(rs.getDouble("budget"));
            campaign.setStatus(rs.getString("status"));
            campaign.setCreatedBy(rs.getInt("createdBy"));
            campaign.setCampaignType(rs.getString("campaignType"));
            return campaign;
        }
    }
}

