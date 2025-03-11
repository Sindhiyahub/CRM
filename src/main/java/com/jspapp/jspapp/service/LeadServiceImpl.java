package com.jspapp.jspapp.service;

import com.jspapp.jspapp.Repository.LeadRepo;
import com.jspapp.jspapp.Repository.LeadRepoImpl;
import com.jspapp.jspapp.dto.Lead;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeadServiceImpl implements LeadService {

    private static final Logger logger = LogManager.getLogger(LeadRepoImpl.class);  // Logger instance

    @Autowired
    private LeadRepo leadRepo;

    @Override
    public List<Lead> getAllLeads() {
        return leadRepo.getAllLeads();
    }

    @Override
    public Lead getLeadById(int leadId) {
        return leadRepo.getLeadById(leadId);
    }
    
    @Override
    public List<Lead> getLeadsByStatus(String status) {
        return leadRepo.getLeadsByStatus(status);
    }

    @Override
    public int addLead(Lead lead) {
        return leadRepo.addLead(lead);
    }

    @Override
    public boolean updateLeadStatus(int leadId, String status) {

        boolean isUpdated = leadRepo.updateLeadStatus(leadId, status);

        if (isUpdated) {
            logger.info("Service: Update successful for Lead ID " + leadId);
        } else {
        	logger.info("Service: Update failed for Lead ID " + leadId);
        }

        return isUpdated;
    }

    @Override
    public boolean updateLead(Lead lead) {
        return leadRepo.updateLead(lead);
    }
    
    @Override
    public boolean deleteLead(int leadId) {
        return leadRepo.deleteLead(leadId);
    }
}
