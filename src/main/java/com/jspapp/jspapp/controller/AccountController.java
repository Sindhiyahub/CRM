package com.jspapp.jspapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.jspapp.jspapp.dto.Account;
import com.jspapp.jspapp.service.AccountService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

@Controller
@RequestMapping("/accounts")
public class AccountController {

    private static final Logger logger = LogManager.getLogger(AccountController.class);  // Logger instance

    @Autowired
    private AccountService accountService;

    // Display all accounts
    @GetMapping
    public String listAccounts(Model model) {
        try {
            List<Account> accounts = accountService.getAllAccounts();
            model.addAttribute("accounts", accounts);
            logger.info("Fetched " + accounts.size() + " accounts.");
            return "accounts"; 
        } catch (Exception e) {
            logger.error("Error fetching accounts: ", e);
            model.addAttribute("error", "Failed to load accounts.");
            return "error";  
        }
    }

 
    @GetMapping("/add")
    public String showAddForm(Model model) {
        try {
            model.addAttribute("account", new Account());
            logger.info("Displaying form to add a new account.");
            return "addAccount"; 
        } catch (Exception e) {
            logger.error("Error displaying add account form: ", e);
            model.addAttribute("error", "Failed to load the form.");
            return "error";  
        }
    }

  
    @PostMapping("/save")
    public String saveAccount(@ModelAttribute Account account) {
        try {
            accountService.saveAccount(account);  
            logger.info("Account saved with ID: " + account.getId());
            return "redirect:/accounts"; 
        } catch (Exception e) {
            logger.error("Error saving account: ", e);
            return "error";  
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        try {
            Account account = accountService.getAccountById(id);
            if (account == null) {
                logger.warn("Account with ID " + id + " not found.");
                return "redirect:/accounts"; 
            }
            model.addAttribute("account", account);
            logger.info("Displaying form to edit account with ID: " + id);
            return "editAccount"; 
        } catch (Exception e) {
            logger.error("Error fetching account for editing: ", e);
            return "error"; 
        }
    }

    
    @PostMapping("/delete/{id}")
    public String deleteAccount(@PathVariable int id) {
        try {
            accountService.deleteAccount(id);
            logger.info("Deleted account with ID: " + id);
            return "redirect:/accounts"; 
        } catch (Exception e) {
            logger.error("Error deleting account with ID " + id + ": ", e);
            return "error";  
        }
    }
}
