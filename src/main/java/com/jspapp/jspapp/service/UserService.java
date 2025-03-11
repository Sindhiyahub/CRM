package com.jspapp.jspapp.service;

import com.jspapp.jspapp.dto.SignupDTO;

import java.util.List;

public interface UserService {
    List<SignupDTO> getAllUsers();

    void addUser(SignupDTO user);

    boolean deleteUser(Long id);

    boolean updateUserStatus(Long id, boolean active);
    
    boolean updateUser(SignupDTO user);
}
