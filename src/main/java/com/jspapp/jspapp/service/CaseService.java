package com.jspapp.jspapp.service;

import com.jspapp.jspapp.dto.Case;
import java.util.List;

public interface CaseService {
    List<Case> getAllCases();
    Case getCaseById(int id);
    void saveCase(Case caseObj);
    void deleteCase(int id);
}
