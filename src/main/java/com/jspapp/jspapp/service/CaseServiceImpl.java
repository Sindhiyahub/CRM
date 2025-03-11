package com.jspapp.jspapp.service;

import com.jspapp.jspapp.dto.Case;
import com.jspapp.jspapp.Repository.CaseRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CaseServiceImpl implements CaseService {

    @Autowired
    private CaseRepo caseRepo;

    @Override
    public List<Case> getAllCases() {
        return caseRepo.getAllCases();
    }

    @Override
    public Case getCaseById(int id) {
        return caseRepo.getCaseById(id);
    }

    @Override
    public void saveCase(Case caseObj) {
        if (caseObj.getId() == 0) {
            caseRepo.addCase(caseObj);
        } else {
            caseRepo.updateCase(caseObj);
        }
    }

    @Override
    public void deleteCase(int id) {
        caseRepo.deleteCase(id);
    }
}
