package com.jspapp.jspapp.controller;

import com.jspapp.jspapp.dto.MarketingCampaign;
import com.jspapp.jspapp.dto.SignupDTO;
import com.jspapp.jspapp.service.MarketingCampaignService;
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
@RequestMapping("/campaigns")
public class MarketingCampaignController {

    private static final Logger logger = LogManager.getLogger(MarketingCampaignController.class);

    @Autowired
    private UserService userService;

    private final MarketingCampaignService campaignService;

    public MarketingCampaignController(MarketingCampaignService campaignService) {
        this.campaignService = campaignService;
    }

 
    @GetMapping
    public String listCampaigns(Model model) {
        try {
            List<MarketingCampaign> campaigns = campaignService.getAllCampaigns();
            model.addAttribute("campaigns", campaigns);
            List<SignupDTO> users = userService.getAllUsers();
            model.addAttribute("users", users);
            return "campaigns";
        } catch (Exception e) {
            logger.error("Error fetching campaigns list: {}", e.getMessage());
            model.addAttribute("error", "An error occurred while fetching campaigns. Please try again later.");
            return "error";  
        }
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        try {
            model.addAttribute("campaign", new MarketingCampaign());
            List<SignupDTO> users = userService.getAllUsers();
            model.addAttribute("users", users);
            return "addCampaign";
        } catch (Exception e) {
            logger.error("Error loading add campaign form: {}", e.getMessage());
            model.addAttribute("error", "An error occurred while loading the form. Please try again.");
            return "error";  
        }
    }


    @PostMapping("/save")
    public String saveCampaign(@ModelAttribute MarketingCampaign campaign, RedirectAttributes redirectAttributes) {
        try {
            if (campaign.getId() > 0) {
                campaignService.updateCampaign(campaign);
                redirectAttributes.addFlashAttribute("message", "Campaign updated successfully!");
            } else {
                campaignService.addCampaign(campaign);
                redirectAttributes.addFlashAttribute("message", "Campaign added successfully!");
            }
            return "redirect:/campaigns";
        } catch (Exception e) {
            logger.error("Error saving campaign: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while saving the campaign. Please try again.");
            return "redirect:/campaigns";
        }
    }

    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model, RedirectAttributes redirectAttributes) {
        try {
            MarketingCampaign campaign = campaignService.getCampaignById(id);
            if (campaign == null) {
                redirectAttributes.addFlashAttribute("error", "Campaign not found!");
                return "redirect:/campaigns";
            }
            model.addAttribute("campaign", campaign);
            List<SignupDTO> users = userService.getAllUsers();
            model.addAttribute("users", users);
            return "editCampaign";
        } catch (Exception e) {
            logger.error("Error loading edit form for campaign {}: {}", id, e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while loading the edit form. Please try again.");
            return "redirect:/campaigns";
        }
    }

  
    @GetMapping("/delete/{id}")
    public String deleteCampaign(@PathVariable int id, RedirectAttributes redirectAttributes) {
        try {
            campaignService.deleteCampaign(id);
            redirectAttributes.addFlashAttribute("message", "Campaign deleted successfully!");
            return "redirect:/campaigns";
        } catch (Exception e) {
            logger.error("Error deleting campaign {}: {}", id, e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred while deleting the campaign. Please try again.");
            return "redirect:/campaigns";
        }
    }
}
