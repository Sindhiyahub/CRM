package com.jspapp.jspapp.service;

import com.jspapp.jspapp.dto.Lead;

import java.util.List;

public interface LeadService {
    List<Lead> getAllLeads();

    Lead getLeadById(int leadId);

    List<Lead> getLeadsByStatus(String status);
    
    int addLead(Lead lead);

    boolean updateLeadStatus(int leadId, String status);
    
    boolean updateLead(Lead lead);

    boolean deleteLead(int leadId);
}
