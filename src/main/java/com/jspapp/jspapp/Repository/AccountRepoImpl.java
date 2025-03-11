package com.jspapp.jspapp.Repository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jspapp.jspapp.dto.Account;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class AccountRepoImpl implements AccountRepo {

    private final JdbcTemplate jdbcTemplate;

    public AccountRepoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Account> getAllAccounts() {
        String sql = "SELECT * FROM account";
        return jdbcTemplate.query(sql, new AccountRowMapper());
    }

    @Override
    public Account getAccountById(int id) {
        String sql = "SELECT * FROM account WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new AccountRowMapper(), id);
    }

    @Override
    public void addAccount(Account account) {
        String sql = "INSERT INTO account (name, phone, type, status, billing_address) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, account.getName(), account.getPhone(), account.getType(), account.getStatus(), account.getBillingAddress());
    
        String sqlId = "SELECT LAST_INSERT_ID()";
        int generatedId = jdbcTemplate.queryForObject(sqlId, Integer.class);
        account.setId(generatedId);
    }

    @Override
    public void updateAccount(Account account) {
        String sql = "UPDATE account SET name=?, phone=?, type=?, status=?, billing_address=? WHERE id=?";
        jdbcTemplate.update(sql, account.getName(), account.getPhone(), account.getType(), account.getStatus(), account.getBillingAddress(), account.getId());
    }

    @Override
    public void deleteAccount(int id) {
        String sql = "DELETE FROM account WHERE id=?";
        jdbcTemplate.update(sql, id);
    }

    private static class AccountRowMapper implements RowMapper<Account> {
        @Override
        public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
            Account account = new Account();
            account.setId(rs.getInt("id"));
            account.setName(rs.getString("name"));
            account.setPhone(rs.getString("phone"));
            account.setType(rs.getString("type"));
            account.setStatus(rs.getString("status"));
            account.setBillingAddress(rs.getString("billing_address"));
            return account;
        }
    }
}

