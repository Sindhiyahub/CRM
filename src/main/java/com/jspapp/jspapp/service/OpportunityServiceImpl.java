package com.jspapp.jspapp.service;

import com.jspapp.jspapp.Repository.OpportunityRepo;
import com.jspapp.jspapp.dto.Opportunity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OpportunityServiceImpl implements OpportunityService {

    @Autowired
    private OpportunityRepo opportunityRepo;

    @Override
    public List<Opportunity> getAllOpportunities() {
        return opportunityRepo.getAllOpportunities();
    }

    @Override
    public void addOpportunity(Opportunity opportunity) {
    	opportunityRepo.addOpportunity(opportunity);
    }

    @Override
    public void deleteOpportunity(int id) {
    	opportunityRepo.deleteOpportunity(id);
    }

    @Override
    public void updateOpportunity(Opportunity opportunity) {
    	opportunityRepo.updateOpportunity(opportunity);
    }
    @Override
    public Opportunity getOpportunityById(int id) {
        return opportunityRepo.getOpportunityById(id);
    }
}

