package com.jspapp.jspapp.Repository;

import com.jspapp.jspapp.dto.SignupDTO;
import java.util.List;

public interface UserValidation {
    boolean validateUser(String username, String password);
    void saveUser(String username, String email, String password,String role);
    SignupDTO getLoggedInUser(String username);
    void addUser(SignupDTO user);
    List<SignupDTO> getAllUsers();
    SignupDTO getUserById(Long userId);
    boolean deleteUser(Long id);
    boolean updateUserStatus(Long id, boolean active);
    boolean updateUser(SignupDTO user);
    boolean isEmailExists(String email);

}
