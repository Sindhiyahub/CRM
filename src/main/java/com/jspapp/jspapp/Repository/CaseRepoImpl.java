package com.jspapp.jspapp.Repository;

import com.jspapp.jspapp.dto.Case;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CaseRepoImpl implements CaseRepo {
    
    private final JdbcTemplate jdbcTemplate;

    public CaseRepoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Case> getAllCases() {
        String sql = "SELECT * FROM cases";
        return jdbcTemplate.query(sql, new CaseRowMapper());
    }

    @Override
    public Case getCaseById(int id) {
        String sql = "SELECT * FROM cases WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new CaseRowMapper(), id);
    }

    @Override
    public void addCase(Case caseObj) {
        String sql = "INSERT INTO cases (createdBy, contactId, subject, details, status) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, caseObj.getCreatedBy(), caseObj.getContactId(), caseObj.getSubject(), caseObj.getDetails(), caseObj.getStatus());
    }

    @Override
    public void updateCase(Case caseObj) {
        String sql = "UPDATE cases SET createdBy=?, contactId=?, subject=?, details=?, status=? WHERE id=?";
        jdbcTemplate.update(sql, caseObj.getCreatedBy(), caseObj.getContactId(), caseObj.getSubject(), caseObj.getDetails(), caseObj.getStatus(), caseObj.getId());
    }

    @Override
    public void deleteCase(int id) {
        String sql = "DELETE FROM cases WHERE id=?";
        jdbcTemplate.update(sql, id);
    }

    private static class CaseRowMapper implements RowMapper<Case> {
        @Override
        public Case mapRow(ResultSet rs, int rowNum) throws SQLException {
            Case caseObj = new Case();
            caseObj.setId(rs.getInt("id"));
            caseObj.setCreatedBy(rs.getInt("createdBy"));
            caseObj.setContactId(rs.getInt("contactId"));
            caseObj.setSubject(rs.getString("subject"));
            caseObj.setDetails(rs.getString("details"));
            caseObj.setStatus(rs.getString("status"));
            caseObj.setCreatedAt(rs.getTimestamp("createdAt"));
            return caseObj;
        }
    }
}

