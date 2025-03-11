package com.jspapp.jspapp.controller;

import com.jspapp.jspapp.dto.Account;
import com.jspapp.jspapp.dto.Lead;
import com.jspapp.jspapp.dto.Opportunity;
import com.jspapp.jspapp.dto.SignupDTO;
import com.jspapp.jspapp.service.AccountService;
import com.jspapp.jspapp.service.LeadService;
import com.jspapp.jspapp.service.OpportunityService;
import com.jspapp.jspapp.service.UserService;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/opportunities")
public class OpportunityController {

    private static final Logger logger = LogManager.getLogger(OpportunityController.class);

    @Autowired
    private OpportunityService opportunityService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;
    @Autowired
    private LeadService leadService;

    // Show list of opportunities
    @GetMapping
    public String listOpportunities(Model model) {
        try {
            List<Opportunity> opportunities = opportunityService.getAllOpportunities();
            model.addAttribute("opportunities", opportunities);

            List<Account> accounts = accountService.getAllAccounts();
            List<SignupDTO> users = userService.getAllUsers();
            List<Lead> leads = leadService.getAllLeads();

            model.addAttribute("accounts", accounts);
            model.addAttribute("users", users);
            model.addAttribute("leads", leads);

            return "opportunities"; // JSP file for displaying the list of opportunities
        } catch (Exception e) {
            logger.error("Error fetching opportunities list: {}", e.getMessage());
            model.addAttribute("error", "An error occurred while fetching opportunities. Please try again later.");
            return "error";  // Redirect to an error page or show error on the current page
        }
    }

    // Show add opportunity form
    @GetMapping("/add")
    public String showAddForm(Model model) {
        try {
            model.addAttribute("opportunity", new Opportunity());

            List<Account> accounts = accountService.getAllAccounts();
            List<SignupDTO> users = userService.getAllUsers();
            List<Lead> leads = leadService.getAllLeads();

            model.addAttribute("accounts", accounts);
            model.addAttribute("users", users);
            model.addAttribute("leads", leads);

            return "addOpportunity"; // JSP file for adding/editing opportunities
        } catch (Exception e) {
            logger.error("Error loading add opportunity form: {}", e.getMessage());
            model.addAttribute("error", "An error occurred while loading the add form. Please try again.");
            return "error";  // Redirect to an error page or show error on the current page
        }
    }

    // Save opportunity
    @PostMapping("/save")
    public String saveOpportunity(@ModelAttribute Opportunity opportunity, RedirectAttributes redirectAttributes) {
        try {
            opportunityService.addOpportunity(opportunity);
            redirectAttributes.addFlashAttribute("message", "Opportunity added successfully!");
            return "redirect:/opportunities";
        } catch (Exception e) {
            logger.error("Error saving opportunity: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while saving the opportunity. Please try again.");
            return "redirect:/opportunities";
        }
    }

    // Show edit opportunity form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model, RedirectAttributes redirectAttributes) {
        try {
            Opportunity opportunity = opportunityService.getOpportunityById(id);
            if (opportunity == null) {
                redirectAttributes.addFlashAttribute("error", "Opportunity not found!");
                return "redirect:/opportunities";
            }

            model.addAttribute("opportunity", opportunity);

            List<Account> accounts = accountService.getAllAccounts();
            List<SignupDTO> users = userService.getAllUsers();
            List<Lead> leads = leadService.getAllLeads();

            model.addAttribute("accounts", accounts);
            model.addAttribute("users", users);
            model.addAttribute("leads", leads);

            return "editOpportunity"; // JSP file for editing the opportunity
        } catch (Exception e) {
            logger.error("Error loading edit form for opportunity {}: {}", id, e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while loading the edit form. Please try again.");
            return "redirect:/opportunities";
        }
    }

    // Delete opportunity
    @PostMapping("/delete/{id}")
    public String deleteOpportunity(@PathVariable int id, RedirectAttributes redirectAttributes) {
        try {
            opportunityService.deleteOpportunity(id);
            redirectAttributes.addFlashAttribute("message", "Opportunity deleted successfully!");
            return "redirect:/opportunities";
        } catch (Exception e) {
            logger.error("Error deleting opportunity {}: {}", id, e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while deleting the opportunity. Please try again.");
            return "redirect:/opportunities";
        }
    }

    // Update opportunity
    @PostMapping("/update")
    public String updateOpportunity(@ModelAttribute Opportunity opportunity, RedirectAttributes redirectAttributes) {
        try {
            opportunityService.updateOpportunity(opportunity);
            redirectAttributes.addFlashAttribute("message", "Opportunity updated successfully!");
            return "redirect:/opportunities";
        } catch (Exception e) {
            logger.error("Error updating opportunity: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while updating the opportunity. Please try again.");
            return "error";
        }
    }
}
