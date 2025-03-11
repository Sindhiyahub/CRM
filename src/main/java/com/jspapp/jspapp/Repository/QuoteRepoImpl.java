package com.jspapp.jspapp.Repository;

import com.jspapp.jspapp.dto.Quote;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class QuoteRepoImpl implements QuoteRepo {

    private final JdbcTemplate jdbcTemplate;

    public QuoteRepoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void addQuote(Quote quote) {
        String sql = "INSERT INTO quotes (opportunityId, amount, description, status, approvedBy) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, quote.getOpportunityId(), quote.getAmount(), quote.getDescription(),
                quote.getStatus(), quote.getApprovedBy());
    }

    @Override
    public List<Quote> getAllQuotes() {
        String sql = "SELECT * FROM quotes";
        return jdbcTemplate.query(sql, new QuoteRowMapper());
    }

    @Override
    public Quote getQuoteById(int id) {
        String sql = "SELECT * FROM quotes WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new QuoteRowMapper(), id);
    }

    @Override
    public void updateQuote(Quote quote) {
        String sql = "UPDATE quotes SET opportunityId=?, amount=?, description=?, status=?, approvedBy=? WHERE id=?";
        jdbcTemplate.update(sql, quote.getOpportunityId(), quote.getAmount(), quote.getDescription(),
                quote.getStatus(), quote.getApprovedBy(), quote.getId());
    }

    @Override
    public void deleteQuote(int id) {
        String sql = "DELETE FROM quotes WHERE id=?";
        jdbcTemplate.update(sql, id);
    }

    private static class QuoteRowMapper implements RowMapper<Quote> {
        @Override
        public Quote mapRow(ResultSet rs, int rowNum) throws SQLException {
            Quote quote = new Quote();
            quote.setId(rs.getInt("id"));
            quote.setOpportunityId(rs.getInt("opportunityId"));
            quote.setAmount(rs.getDouble("amount"));
            quote.setDescription(rs.getString("description"));
            quote.setStatus(rs.getString("status"));
            quote.setCreatedAt(rs.getString("createdAt"));
            quote.setApprovedBy(rs.getInt("approvedBy"));
            return quote;
        }
    }
}
