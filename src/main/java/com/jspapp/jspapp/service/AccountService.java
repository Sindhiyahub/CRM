package com.jspapp.jspapp.service;

import java.util.List;

import com.jspapp.jspapp.dto.Account;

public interface AccountService {
    List<Account> getAllAccounts();
    Account getAccountById(int id);
    void saveAccount(Account account);
    void deleteAccount(int id);
}

