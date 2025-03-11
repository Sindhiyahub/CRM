package com.jspapp.jspapp.Repository;

import com.jspapp.jspapp.dto.SignupDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserValidationImpl implements UserValidation {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public boolean validateUser(String username, String password) {
        String sql = "SELECT COUNT(*) FROM userdetails WHERE username = ? AND password = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, username, password);
        return count != null && count == 1;
    }

    @Override
    public void saveUser(String username, String email, String password, String role) {
        String query = "SELECT COUNT(*) FROM userdetails WHERE email = ?";
        int count = jdbcTemplate.queryForObject(query, Integer.class, email);

        if (count > 0) {
            throw new IllegalArgumentException("Email already registered!");
        }

        String insertQuery = "INSERT INTO userdetails (username, email, password,role) VALUES (?, ?, ?,?)";
        jdbcTemplate.update(insertQuery, username, email, password,role);
    }

    @Override
    public SignupDTO getLoggedInUser(String username) {
        System.out.println("Fetching user with username: " + username);

        String sql = "SELECT username, email FROM userdetails WHERE username = ?";

        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
            SignupDTO user = new SignupDTO();
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            return user;
        }, username);
    }

    @Override
    public void addUser(SignupDTO user) {
        String query = "SELECT COUNT(*) FROM userdetails WHERE email = ?";
        int count = jdbcTemplate.queryForObject(query, Integer.class, user.getEmail());

        if (count > 0) {
            throw new IllegalArgumentException("Email already registered!");
        }

        String insertQuery = "INSERT INTO userdetails (username, email, password, status, role) VALUES (?, ?, ?, ?,?)";
        jdbcTemplate.update(insertQuery, user.getUsername(), user.getEmail(), user.getPassword(), user.isActive(),user.getRole());
    }

    @Override
    public List<SignupDTO> getAllUsers() {
        String sql = "SELECT id, username, email, status, role FROM userdetails";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            SignupDTO user = new SignupDTO();
            user.setId(rs.getLong("id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setActive(rs.getBoolean("status"));
            user.setRole(rs.getString("role")); 
            return user;
        });
    }
    
    @Override
    public SignupDTO getUserById(Long userId) {
        String sql = "SELECT id, username, email, role, status FROM userdetails WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
            SignupDTO user = new SignupDTO();
            user.setId(rs.getLong("id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));
            user.setActive(rs.getBoolean("status"));
            return user;
        }, userId);
    }


    @Override
    public boolean deleteUser(Long id) {
        String sql = "DELETE FROM userdetails WHERE id = ?";
        int rowsAffected = jdbcTemplate.update(sql, id);
        return rowsAffected > 0;
    }

    @Override
    public boolean updateUserStatus(Long id, boolean active) {
        String sql = "UPDATE userdetails SET status = ? WHERE id = ?";
        int rowsAffected = jdbcTemplate.update(sql, active, id);
        return rowsAffected > 0;
    }   
    
    @Override
    public boolean updateUser(SignupDTO user) {
        String sql = "UPDATE userdetails SET username=?, email=?, role=?, status=? WHERE id=?";
        int rowsAffected = jdbcTemplate.update(sql, 
            user.getUsername(), 
            user.getEmail(), 
            user.getRole(), 
            user.isActive(), 
            user.getId()
        );
        return rowsAffected > 0;
    }
    @Override
    public boolean isEmailExists(String email) {
        String sql = "SELECT COUNT(*) FROM userdetails WHERE email = ?";
        int count = jdbcTemplate.queryForObject(sql, Integer.class, email);
        return count > 0;
    }


}
