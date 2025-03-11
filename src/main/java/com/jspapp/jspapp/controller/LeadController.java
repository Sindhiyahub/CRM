package com.jspapp.jspapp.controller;

import com.jspapp.jspapp.dto.Account;
import com.jspapp.jspapp.dto.Contact;
import com.jspapp.jspapp.dto.Lead;
import com.jspapp.jspapp.dto.SignupDTO;
import com.jspapp.jspapp.service.AccountService;
import com.jspapp.jspapp.service.ContactService;
import com.jspapp.jspapp.service.LeadService;
import com.jspapp.jspapp.service.UserService;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LeadController {

    private static final Logger logger = LogManager.getLogger(LeadController.class);  // Logger instance

    
    @Autowired
    private UserService userService;
    
    @Autowired
    private LeadService leadService;
    
    @Autowired
    private AccountService accountService; 

    @Autowired
    private ContactService contactService; 

    @GetMapping("/leads")
    public String getLeadsPage(@RequestParam(value = "statusFilter", required = false) String statusFilter, Model model, RedirectAttributes redirectAttributes) {
        try {
            List<Lead> leads;
            if (statusFilter != null && !statusFilter.isEmpty()) {
                leads = leadService.getLeadsByStatus(statusFilter);
                model.addAttribute("statusFilter", statusFilter); 
                List<SignupDTO> users = userService.getAllUsers();
                model.addAttribute("users", users);
                
                logger.info("Filtered leads by status: {}", statusFilter);
            } else {
              
                leads = leadService.getAllLeads();
                logger.info("Displaying all leads.");
            }
            model.addAttribute("leads", leads);
            return "leads";
        } catch (Exception e) {
            logger.error("Error fetching leads: ", e);
            redirectAttributes.addFlashAttribute("error", "Failed to load leads. Please try again.");
            return "redirect:/error";
        }
    }

    @GetMapping("/leads/{id}")
    public String viewLead(@PathVariable("id") int leadId, Model model, RedirectAttributes redirectAttributes) {
        try {
            Lead lead = leadService.getLeadById(leadId);
            if (lead != null) {
                model.addAttribute("lead", lead);
                logger.info("Viewing lead with ID: {}", leadId);
                return "view-lead";
            } else {
                redirectAttributes.addFlashAttribute("error", "Lead not found.");
                logger.warn("Lead with ID {} not found.", leadId);
                return "redirect:/leads";
            }
        } catch (Exception e) {
            logger.error("Error viewing lead with ID {}: ", leadId, e);
            redirectAttributes.addFlashAttribute("error", "Failed to view lead. Please try again.");
            return "redirect:/error";
        }
    }

    @GetMapping("/addLead")
    public String showAddLeadPage(Model model) {
        model.addAttribute("lead", new Lead());
        List<SignupDTO> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "addLead";
    }

    @PostMapping("/addLead")
    public String addLead(@ModelAttribute Lead lead, RedirectAttributes redirectAttributes) {
        try {
            leadService.addLead(lead);
            redirectAttributes.addFlashAttribute("message", "Lead added successfully!");
            logger.info("Lead added successfully: {}", lead);
        } catch (Exception e) {
            logger.error("Error adding lead: ", e);
            redirectAttributes.addFlashAttribute("error", "Failed to add lead. Please try again.");
        }
        return "redirect:/leads";
    }

    @PostMapping("/updateLeadStatus")
    public String updateLeadStatus(
            @RequestParam("leadId") int leadId,
            @RequestParam("status") String status,
            RedirectAttributes redirectAttributes) {
        try {
            boolean isUpdated = leadService.updateLeadStatus(leadId, status);
            if (isUpdated) {
                redirectAttributes.addFlashAttribute("message", "Lead status updated successfully!");
                logger.info("Lead status updated successfully for Lead ID: {} to status: {}", leadId, status);
            } else {
                redirectAttributes.addFlashAttribute("error", "Failed to update lead status. Lead may not exist.");
                logger.warn("Failed to update lead status for Lead ID: {}. Lead may not exist.", leadId);
            }
        } catch (Exception e) {
            logger.error("Error updating lead status for Lead ID {}: ", leadId, e);
            redirectAttributes.addFlashAttribute("error", "An error occurred while updating lead status. Please try again.");
        }
        return "redirect:/leads";
    }

    @PostMapping("/deleteLead")
    public String deleteLead(@RequestParam("leadId") int leadId, RedirectAttributes redirectAttributes) {
        try {
            leadService.deleteLead(leadId);
            redirectAttributes.addFlashAttribute("message", "Lead deleted successfully!");
            logger.info("Lead deleted successfully with ID: {}", leadId);
        } catch (Exception e) {
            logger.error("Error deleting lead with ID {}: ", leadId, e);
            redirectAttributes.addFlashAttribute("error", "Failed to delete lead. Please try again.");
        }
        return "redirect:/leads";
    }
    
    @PostMapping("/convertToAccountContact/{leadId}")
    public String convertLeadToAccountAndContact(@PathVariable int leadId, RedirectAttributes redirectAttributes) {
        try {
            
            Lead lead = leadService.getLeadById(leadId);

            if (lead != null) {
               
                Account account = new Account();
                account.setName(lead.getCompany()); // Assuming Company Name from Lead
                account.setPhone(lead.getPhone()); // Assuming Phone from Lead
                account.setStatus("Active"); 

                // Save Account first
                accountService.saveAccount(account);
                System.out.print(account.getId());        
                logger.info("Saved Account ID: {}", account.getId());
                logger.info("Account created from Lead: {}", account);
            
                if (account.getId() == 0) {
                    throw new IllegalStateException("Failed to generate valid Account ID.");
                }
                // Create Contact from Lead
                Contact contact = new Contact();
                contact.setName(lead.getName()); 
                contact.setEmail(lead.getEmail());
                contact.setPhone(lead.getPhone()); 
                contact.setAccountId(account.getId()); 

             
                contactService.addContact(contact);
                logger.info("Contact created from Lead: {}", contact);

                
                lead.setStatus("Converted"); 
                leadService.updateLead(lead); 

                redirectAttributes.addFlashAttribute("message", "Lead successfully converted into Account and Contact!");
                logger.info("Lead with ID {} successfully converted to Account and Contact.", leadId);
            } else {
                redirectAttributes.addFlashAttribute("error", "Lead not found!");
                logger.warn("Lead with ID {} not found for conversion.", leadId);
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to convert lead. Please try again.");
            logger.error("Error converting lead with ID {}: ", leadId, e);
        }
        return "redirect:/leads"; 
    }
    
    @GetMapping("/editLead/{id}")
    public String showEditLeadPage(@PathVariable("id") int id, Model model, RedirectAttributes redirectAttributes) {
        try {
            Lead lead = leadService.getLeadById(id);
            if (lead != null) {
                model.addAttribute("lead", lead);
                List<SignupDTO> users = userService.getAllUsers();
                model.addAttribute("users", users);
                return "editLead";  
            } else {
                redirectAttributes.addFlashAttribute("error", "Lead not found.");
                return "redirect:/leads";
            }
        } catch (Exception e) {
            logger.error("Error fetching lead for editing: ", e);
            redirectAttributes.addFlashAttribute("error", "Error loading lead. Try again.");
            return "redirect:/leads";
        }
    }

    @PostMapping("/updateLead")
    public String updateLead(@RequestParam("leadId") int leadId, @ModelAttribute Lead lead, RedirectAttributes redirectAttributes) {
        try {
            lead.setId(leadId); 
            boolean isUpdated = leadService.updateLead(lead);
            if (isUpdated) {
                redirectAttributes.addFlashAttribute("message", "Lead updated successfully!");
            } else {
                redirectAttributes.addFlashAttribute("error", "Lead update failed.");
            }
        } catch (Exception e) {
            logger.error("Error updating lead: ", e);
            redirectAttributes.addFlashAttribute("error", "An error occurred.");
        }
        return "redirect:/leads";
    }


}
