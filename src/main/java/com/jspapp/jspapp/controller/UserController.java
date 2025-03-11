package com.jspapp.jspapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.jspapp.jspapp.Repository.UserValidation;
import com.jspapp.jspapp.dto.SignupDTO;
import com.jspapp.jspapp.service.UserService;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserValidation userValidation;
    @Autowired
    private UserService userService;

    @GetMapping("/usermanagement")
    public String getAllUsers(Model model) {
        try {
            List<SignupDTO> users = userValidation.getAllUsers();
            model.addAttribute("users", users);
            model.addAttribute("message", "User list fetched successfully!");
        } catch (Exception e) {
            model.addAttribute("error", "Failed to fetch the user list. Please try again.");
            e.printStackTrace();
        }
        return "usermanagement";
    }

    // Add a new user
    @PostMapping("/addUser")
    public String addUser(@ModelAttribute("newUser") SignupDTO user, Model model) {
        try {
            userService.addUser(user);
            model.addAttribute("message", "User added successfully!");
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            model.addAttribute("error", "Failed to add user. Please try again.");
            e.printStackTrace();
        }
        return "redirect:/usermanagement";
    }
    @GetMapping("/addUser")
    public String showAddUserForm(Model model) {
        model.addAttribute("newUser", new SignupDTO());
        return "addUser"; 
    }
    

    @GetMapping("/manageUser")
    public String showEditUserForm(@RequestParam("userId") Long userId, Model model) {
        try {
            SignupDTO user = userValidation.getUserById(userId);
            model.addAttribute("user", user);
            return "manageUser"; 
        } catch (Exception e) {
            model.addAttribute("error", "User not found.");
            return "redirect:/usermanagement";
        }
    }

    
    @PostMapping("/updateUser")
    public String updateUser(@RequestParam("userId") Long userId,
    	    @RequestParam("username") String username,
    	    @RequestParam("email") String email,
    	    @RequestParam("role") String role,
    	    @RequestParam("active") boolean active, Model model) {
        try {
            SignupDTO user = userValidation.getUserById(userId);
            if (user == null) {
                model.addAttribute("error", "User not found.");
                return "redirect:/usermanagement";
            }

            user.setUsername(username);
            user.setEmail(email);
            user.setRole(role);
            user.setActive(active);
            userService.updateUser(user);
            model.addAttribute("message", "User updated successfully!");
        } catch (Exception e) {
            model.addAttribute("error", "Failed to update user.");
            e.printStackTrace();
        }
        return "redirect:/usermanagement";
    }

    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("userId") Long userId, Model model) {
        try {
            userService.deleteUser(userId);
            model.addAttribute("message", "User deleted successfully!");
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            model.addAttribute("error", "Failed to delete user. Please try again.");
            e.printStackTrace();
        }
        return "redirect:/usermanagement";
    }

   
}
