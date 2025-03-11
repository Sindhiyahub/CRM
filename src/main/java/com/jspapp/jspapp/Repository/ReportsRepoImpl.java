package com.jspapp.jspapp.Repository;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.jspapp.jspapp.Repository.ReportsRepo;

@Repository
public class ReportsRepoImpl implements ReportsRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> getSalesData() {
        String sql = "SELECT stage, COUNT(*) AS total FROM opportunity GROUP BY stage";
        return jdbcTemplate.queryForList(sql);
    }

    @Override
    public List<Map<String, Object>> getCustomerData() {
        String sql = "SELECT type, COUNT(*) AS total FROM account GROUP BY type";
        return jdbcTemplate.queryForList(sql);
    }
}
