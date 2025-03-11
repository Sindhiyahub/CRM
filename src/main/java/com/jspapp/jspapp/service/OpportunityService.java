package com.jspapp.jspapp.service;

import com.jspapp.jspapp.dto.Opportunity;
import java.util.List;

public interface OpportunityService {
    List<Opportunity> getAllOpportunities();
    void addOpportunity(Opportunity opportunity);
    void deleteOpportunity(int id);
    void updateOpportunity(Opportunity opportunity);
	Opportunity getOpportunityById(int id);
}
