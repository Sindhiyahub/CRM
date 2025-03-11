package com.jspapp.jspapp.controller;

import com.jspapp.jspapp.dto.Opportunity;
import com.jspapp.jspapp.dto.Quote;
import com.jspapp.jspapp.dto.SignupDTO;
import com.jspapp.jspapp.service.OpportunityService;
import com.jspapp.jspapp.service.QuoteService;
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
@RequestMapping("/quotes")
public class QuoteController {

    private static final Logger logger = LogManager.getLogger(QuoteController.class);

    @Autowired
    private UserService userService;
	
    @Autowired
    private OpportunityService opportunityService;
	
    private final QuoteService quoteService;

    public QuoteController(QuoteService quoteService) {
        this.quoteService = quoteService;
    }

    // Show list of quotes
    @GetMapping
    public String listQuotes(Model model, RedirectAttributes redirectAttributes) {
        try {
            List<Quote> quotes = quoteService.getAllQuotes();
            model.addAttribute("quotes", quotes);
            
            List<SignupDTO> users = userService.getAllUsers();
            List<Opportunity> opportunities = opportunityService.getAllOpportunities();
            
            model.addAttribute("users", users);
            model.addAttribute("opportunities", opportunities);

            return "quotes"; 
        } catch (Exception e) {
            logger.error("Error fetching quotes list: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while fetching quotes. Please try again.");
            return "redirect:/quotes"; 
        }
    }

 
    @GetMapping("/add")
    public String showAddForm(Model model) {
        try {
            model.addAttribute("quote", new Quote());
            
            List<SignupDTO> users = userService.getAllUsers();
            List<Opportunity> opportunities = opportunityService.getAllOpportunities();
            
            model.addAttribute("users", users);
            model.addAttribute("opportunities", opportunities);

            return "addQuote"; 
        } catch (Exception e) {
            logger.error("Error loading add quote form: {}", e.getMessage());
            model.addAttribute("error", "An error occurred while loading the add form. Please try again.");
            return "error"; 
        }
    }

    @PostMapping("/save")
    public String saveQuote(@ModelAttribute Quote quote, RedirectAttributes redirectAttributes) {
        try {
            quoteService.addQuote(quote);
            redirectAttributes.addFlashAttribute("message", "Quote added successfully!");
            return "redirect:/quotes";
        } catch (Exception e) {
            logger.error("Error saving quote: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while saving the quote. Please try again.");
            return "redirect:/quotes";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model, RedirectAttributes redirectAttributes) {
        try {
            Quote quote = quoteService.getQuoteById(id);
            if (quote == null) {
                redirectAttributes.addFlashAttribute("error", "Quote not found!");
                return "redirect:/quotes";
            }

            model.addAttribute("quote", quote);
            
            List<SignupDTO> users = userService.getAllUsers();
            List<Opportunity> opportunities = opportunityService.getAllOpportunities();
            
            model.addAttribute("users", users);
            model.addAttribute("opportunities", opportunities);

            return "editQuote";
        } catch (Exception e) {
            logger.error("Error loading edit form for quote {}: {}", id, e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while loading the edit form. Please try again.");
            return "redirect:/quotes";
        }
    }

    // Update quote
    @PostMapping("/update")
    public String updateQuote(@ModelAttribute Quote quote, RedirectAttributes redirectAttributes) {
        try {
            quoteService.updateQuote(quote);
            redirectAttributes.addFlashAttribute("message", "Quote updated successfully!");
            return "redirect:/quotes";
        } catch (Exception e) {
            logger.error("Error updating quote: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while updating the quote. Please try again.");
            return "redirect:/quotes";
        }
    }

   
    @GetMapping("/delete/{id}")
    public String deleteQuote(@PathVariable int id, RedirectAttributes redirectAttributes) {
        try {
            quoteService.deleteQuote(id);
            redirectAttributes.addFlashAttribute("message", "Quote deleted successfully!");
            return "redirect:/quotes";
        } catch (Exception e) {
            logger.error("Error deleting quote {}: {}", id, e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while deleting the quote. Please try again.");
            return "redirect:/quotes";
        }
    }
}
