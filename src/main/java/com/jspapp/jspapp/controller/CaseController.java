package com.jspapp.jspapp.controller;

import com.jspapp.jspapp.dto.Case;
import com.jspapp.jspapp.dto.Contact;
import com.jspapp.jspapp.dto.SignupDTO;
import com.jspapp.jspapp.service.CaseService;
import com.jspapp.jspapp.service.ContactService;
import com.jspapp.jspapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

@Controller
@RequestMapping("/cases")
public class CaseController {

    private static final Logger logger = LogManager.getLogger(CaseController.class); 

    @Autowired
    private CaseService caseService;
    @Autowired
    private ContactService contactService;  
    @Autowired
    private UserService userService;       

    
    @GetMapping
    public String listCases(Model model) {
        try {
            List<Case> cases = caseService.getAllCases();
            model.addAttribute("cases", cases);

            List<Contact> contacts = contactService.getAllContacts(); // Get all contacts
            List<SignupDTO> users = userService.getAllUsers();            

            model.addAttribute("contacts", contacts);
            model.addAttribute("users", users);

            logger.info("Successfully fetched " + cases.size() + " cases.");
            return "cases"; // JSP file for displaying the list of cases
        } catch (Exception e) {
            logger.error("Error fetching cases: ", e);
            model.addAttribute("error", "Failed to load cases.");
            return "error";  // JSP file for displaying error message
        }
    }

    
    @GetMapping("/add")
    public String showAddForm(Model model) {
        try {
            model.addAttribute("caseObj", new Case());

            
            List<Contact> contacts = contactService.getAllContacts();
            List<SignupDTO> users = userService.getAllUsers();

            model.addAttribute("contacts", contacts);
            model.addAttribute("users", users);

            logger.info("Displaying form to add a new case.");
            return "addCase";
        } catch (Exception e) {
            logger.error("Error displaying add case form: ", e);
            model.addAttribute("error", "Failed to load add case form.");
            return "error";  
        }
    }

   
    @PostMapping("/save")
    public String saveCase(@ModelAttribute Case caseObj) {
        try {
            caseService.saveCase(caseObj); 
            logger.info("Case saved with ID: " + caseObj.getId());
            return "redirect:/cases"; 
        } catch (Exception e) {
            logger.error("Error saving case: ", e);
            return "error";  
        }
    }
    


    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        try {
            Case caseObj = caseService.getCaseById(id);
            model.addAttribute("caseObj", caseObj);

          
            List<Contact> contacts = contactService.getAllContacts();
            List<SignupDTO> users = userService.getAllUsers();

            model.addAttribute("contacts", contacts);
            model.addAttribute("users", users);

            logger.info("Displaying form to edit case with ID: " + id);
            return "editCase"; 
        } catch (Exception e) {
            logger.error("Error fetching case for editing: ", e);
            return "error";  
        }
    }

    
    @PostMapping("/delete/{id}")
    public String deleteCase(@PathVariable int id) {
        try {
            caseService.deleteCase(id); 
            logger.info("Deleted case with ID: " + id);
            return "redirect:/cases"; 
        } catch (Exception e) {
            logger.error("Error deleting case with ID " + id + ": ", e);
            return "error"; 
        }
    }

  
    @PostMapping("/update")
    public String updateCase(@ModelAttribute Case caseObj) {
        try {
            caseService.saveCase(caseObj);
            logger.info("Updated case with ID: " + caseObj.getId());
            return "redirect:/cases"; 
        } catch (Exception e) {
            logger.error("Error updating case: ", e);
            return "error"; 
        }
    }
}
