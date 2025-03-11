package com.jspapp.jspapp.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jspapp.jspapp.Repository.UserValidation;
import com.jspapp.jspapp.dto.SignupDTO;
import com.jspapp.jspapp.dto.UserLoginDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    private static final Logger logger = LogManager.getLogger(LoginController.class);  // Logger instance

    @Autowired
    private UserValidation userValidation;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("userLoginDTO", new UserLoginDTO());
        model.addAttribute("signupDTO", new SignupDTO());
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("userLoginDTO") UserLoginDTO userloginDTO, Model model, RedirectAttributes redirectAttributes) {
        try {
            String username = userloginDTO.getUsername();
            String password = userloginDTO.getPassword();

            logger.info("Attempting login for user: {}", username);

            boolean isValid = userValidation.validateUser(username, password);
            if (isValid) {
                model.addAttribute("username", username);
                logger.info("User {} logged in successfully", username);
                return "dashboard";
            } else {
                redirectAttributes.addFlashAttribute("error", "Invalid username or password!");
                logger.warn("Invalid login attempt for user: {}", username);
                return "redirect:/";
            }
        } catch (Exception e) {
            logger.error("Error during login attempt for user {}: {}", userloginDTO.getUsername(), e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred during login: " + e.getMessage());
            return "redirect:/";
        }
    }


    @PostMapping("/signup")
    public String signup(@ModelAttribute("signupDTO") SignupDTO signupDTO, RedirectAttributes redirectAttributes) {
        try {
            String username = signupDTO.getUsername();
            String email = signupDTO.getEmail();

            logger.info("Attempting to register user: {}", username);

            // Check if email already exists
            boolean emailExists = userValidation.isEmailExists(email);
            if (emailExists) {
                redirectAttributes.addFlashAttribute("error", "Email already exists! Please use a different email.");
                return "redirect:/";  
            }

          
            userValidation.saveUser(username, email, signupDTO.getPassword(), signupDTO.getRole());

            redirectAttributes.addFlashAttribute("message", "User successfully registered!");
            logger.info("User {} successfully registered", username);
            return "redirect:/?registered=true";
        } catch (Exception e) {
            logger.error("Error during signup for user {}: {}", signupDTO.getUsername(), e.getMessage());
            redirectAttributes.addFlashAttribute("error", "An error occurred during signup: " + e.getMessage());
            return "redirect:/?error=true";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        try {
            logger.info("Logout endpoint triggered");
            session.invalidate();
            logger.info("Session invalidated successfully");
            return "redirect:/";
        } catch (Exception e) {
            logger.error("Error during logout: {}", e.getMessage());
            return "redirect:/?logoutError=true";
        }
    }

    @GetMapping("/home")
    public String homePage(@RequestParam("username") String username, Model model) {
        try {
            model.addAttribute("username", username);
            logger.info("Loading home page for user: {}", username);
            return "home";
        } catch (Exception e) {
            logger.error("Error loading home page for user {}: {}", username, e.getMessage());
            model.addAttribute("error", "An error occurred while loading the home page: " + e.getMessage());
            return "login";
        }
    }

    @GetMapping("/userdashboard")
    public String userDashboard(@RequestParam("username") String username, Model model) {
        try {
            logger.info("Fetching user dashboard for username: {}", username);

            SignupDTO signupDTO = userValidation.getLoggedInUser(username);

            if (signupDTO == null) {
                model.addAttribute("error", "User not found!");
                logger.warn("User not found with username: {}", username);
                return "login";
            }

            model.addAttribute("signupDTO", signupDTO);
            logger.info("Displaying user dashboard for username: {}", username);
            return "userdashboard";
        } catch (Exception e) {
            logger.error("Error fetching user dashboard for user {}: {}", username, e.getMessage());
            model.addAttribute("error", "An error occurred while loading the user dashboard: " + e.getMessage());
            return "login";
        }
    }
}
