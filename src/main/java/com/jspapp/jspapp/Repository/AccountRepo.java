package com.jspapp.jspapp.Repository;

import java.util.List;

import com.jspapp.jspapp.dto.Account;

public interface AccountRepo {
    List<Account> getAllAccounts();
    Account getAccountById(int id);
    void addAccount(Account account);
    void updateAccount(Account account);
    void deleteAccount(int id);
}

