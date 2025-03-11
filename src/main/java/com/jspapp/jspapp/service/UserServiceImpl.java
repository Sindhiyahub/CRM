package com.jspapp.jspapp.service;

import com.jspapp.jspapp.Repository.UserValidation;
import com.jspapp.jspapp.dto.SignupDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserValidation userValidation;

    @Override
    public List<SignupDTO> getAllUsers() {
        return userValidation.getAllUsers();
    }

    @Override
    public void addUser(SignupDTO user) {
        // Add user via UserValidation
        userValidation.addUser(user);
    }

    @Override
    public boolean deleteUser(Long id) {
        return userValidation.deleteUser(id);
    }

    @Override
    public boolean updateUserStatus(Long id, boolean active) {
        return userValidation.updateUserStatus(id, active);
    }
    
    @Override
    public boolean updateUser(SignupDTO user) {
        return userValidation.updateUser(user);
    }

}
