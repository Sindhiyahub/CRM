package com.jspapp.jspapp.controller;

import com.jspapp.jspapp.dto.Contact;
import com.jspapp.jspapp.service.ContactService;
import com.jspapp.jspapp.service.AccountService;
import com.jspapp.jspapp.dto.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

@Controller
@RequestMapping("/contacts")
public class ContactController {

    private static final Logger logger = LogManager.getLogger(ContactController.class); 

    @Autowired
    private ContactService contactService;

    @Autowired
    private AccountService accountService;

    @GetMapping
    public String listContacts(Model model) {
        try {
            List<Contact> contacts = contactService.getAllContacts();
            List<Account> accounts = accountService.getAllAccounts(); 

            model.addAttribute("contacts", contacts);
            model.addAttribute("accounts", accounts); 

            logger.info("Successfully fetched " + contacts.size() + " contacts.");
            return "contacts";
        } catch (Exception e) {
            logger.error("Error fetching contacts: ", e);
            model.addAttribute("error", "Failed to load contacts.");
            return "error"; 
        }
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        try {
            model.addAttribute("contact", new Contact());

            
            List<Account> accounts = accountService.getAllAccounts();
            model.addAttribute("accounts", accounts);

            logger.info("Displaying form to add a new contact.");
            return "addContact"; 
        } catch (Exception e) {
            logger.error("Error displaying add contact form: ", e);
            model.addAttribute("error", "Failed to load add contact form.");
            return "error"; 
        }
    }

    @PostMapping("/save")
    public String saveContact(@ModelAttribute("contact") Contact contact) {
        try {
            contactService.addContact(contact);
            logger.info("Contact saved with ID: " + contact.getId());
            return "redirect:/contacts";
        } catch (Exception e) {
            logger.error("Error saving contact: ", e);
            return "error"; 
        }
    }

    @PostMapping("/delete/{id}")
    public String deleteContact(@PathVariable int id) {
        try {
            contactService.deleteContact(id);
            logger.info("Deleted contact with ID: " + id);
            return "redirect:/contacts";
        } catch (Exception e) {
            logger.error("Error deleting contact with ID " + id + ": ", e);
            return "error";  
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        try {
            
            Contact contact = contactService.getContactById(id);

            
            model.addAttribute("contact", contact);
            model.addAttribute("accounts", accountService.getAllAccounts());

            logger.info("Displaying form to edit contact with ID: " + id);
            return "editContact";  
        } catch (Exception e) {
            logger.error("Error fetching contact for editing: ", e);
            return "error";  
        }
    }

    @PostMapping("/update")
    public String updateContact(@ModelAttribute("contact") Contact contact) {
        try {
            contactService.updateContact(contact);
            logger.info("Updated contact with ID: " + contact.getId());
            return "redirect:/contacts";
        } catch (Exception e) {
            logger.error("Error updating contact: ", e);
            return "error";  
        }
    }
}
