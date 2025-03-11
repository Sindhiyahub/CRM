package com.jspapp.jspapp.Repository;

import com.jspapp.jspapp.dto.Case;
import java.util.List;

public interface CaseRepo {
    List<Case> getAllCases();
    Case getCaseById(int id);
    void addCase(Case caseObj);
    void updateCase(Case caseObj);
    void deleteCase(int id);
}

