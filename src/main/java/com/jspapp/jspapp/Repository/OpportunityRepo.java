package com.jspapp.jspapp.Repository;

import com.jspapp.jspapp.dto.Opportunity;
import java.util.List;

public interface OpportunityRepo {
    List<Opportunity> getAllOpportunities();
    void addOpportunity(Opportunity opportunity);
    void deleteOpportunity(int id);
    void updateOpportunity(Opportunity opportunity);
	Opportunity getOpportunityById(int id);
}

