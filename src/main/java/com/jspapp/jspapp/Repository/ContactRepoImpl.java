package com.jspapp.jspapp.Repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jspapp.jspapp.dto.Contact;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ContactRepoImpl implements ContactRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void addContact(Contact contact) {
        String sql = "INSERT INTO contact (name, email, phone, accountId, company) " +
                     "VALUES (?, ?, ?, ?, (SELECT name FROM account WHERE id = ?))";
        jdbcTemplate.update(sql, contact.getName(), contact.getEmail(), contact.getPhone(), 
                            contact.getAccountId(), contact.getAccountId());
    }

    public List<Contact> getAllContacts() {
        String sql = "SELECT c.id, c.name, c.email, c.phone, c.accountId, a.name AS company " +
                     "FROM contact c " +
                     "JOIN account a ON c.accountId = a.id";

        return jdbcTemplate.query(sql, new RowMapper<Contact>() {
            @Override
            public Contact mapRow(ResultSet rs, int rowNum) throws SQLException {
                Contact contact = new Contact();
                contact.setId(rs.getInt("id"));
                contact.setName(rs.getString("name"));
                contact.setEmail(rs.getString("email"));
                contact.setPhone(rs.getString("phone"));
                contact.setAccountId(rs.getInt("accountId"));
                contact.setCompany(rs.getString("company")); 
                return contact;
            }
        });
    }

    @Override
    public Contact getContactById(int id) {
        String sql = "SELECT id, name, email, phone, accountId, company FROM contact WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new ContactRowMapper(), id);
    }

    @Override
    public boolean updateContact(Contact contact) {
        String sql = "UPDATE contact SET name=?, email=?, phone=?, accountId=?, company=(SELECT name FROM account WHERE id = ?) WHERE id=?";
        int rows = jdbcTemplate.update(sql, contact.getName(), contact.getEmail(), contact.getPhone(),
                contact.getAccountId(), contact.getAccountId(), contact.getId());
        return rows > 0;
    }

    @Override
    public boolean deleteContact(int id) {
        String sql = "DELETE FROM contact WHERE id = ?";
        int rows = jdbcTemplate.update(sql, id);
        return rows > 0;
    }

    private static class ContactRowMapper implements RowMapper<Contact> {
        @Override
        public Contact mapRow(ResultSet rs, int rowNum) throws SQLException {
            Contact contact = new Contact();
            contact.setId(rs.getInt("id"));
            contact.setName(rs.getString("name"));
            contact.setEmail(rs.getString("email"));
            contact.setPhone(rs.getString("phone"));
            contact.setAccountId(rs.getInt("accountId"));
            contact.setCompany(rs.getString("company"));
            return contact;
        }
    }
}

