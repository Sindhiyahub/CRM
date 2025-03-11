package com.jspapp.jspapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspapp.jspapp.Repository.AccountRepo;
import com.jspapp.jspapp.dto.Account;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
    private  AccountRepo accountRepo;
    @Override
    public List<Account> getAllAccounts() {
        return accountRepo.getAllAccounts();
    }

    @Override
    public Account getAccountById(int id) {
        return accountRepo.getAccountById(id);
    }

    @Override
    public void saveAccount(Account account) {
        if (account.getId() == 0) {
        	accountRepo.addAccount(account);
        } else {
        	accountRepo.updateAccount(account);
        }
    }

    @Override
    public void deleteAccount(int id) {
    	accountRepo.deleteAccount(id);
    }
}

