package com.jspapp.jspapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspapp.jspapp.Repository.ContactRepo;
import com.jspapp.jspapp.dto.Contact;

import java.util.List;

@Service
public class ContactServiceImpl implements ContactService {

    @Autowired
    private ContactRepo contactRepo;

    @Override
    public void addContact(Contact contact) {
    	contactRepo.addContact(contact);
    }

    @Override
    public List<Contact> getAllContacts() {
        return contactRepo.getAllContacts();
    }

    @Override
    public Contact getContactById(int id) {
        return contactRepo.getContactById(id);
    }

    @Override
    public boolean updateContact(Contact contact) {
        return contactRepo.updateContact(contact);
    }

    @Override
    public boolean deleteContact(int id) {
        return contactRepo.deleteContact(id);
    }
}

