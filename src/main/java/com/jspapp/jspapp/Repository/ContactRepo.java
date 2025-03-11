package com.jspapp.jspapp.Repository;


import java.util.List;

import com.jspapp.jspapp.dto.Contact;

public interface ContactRepo {
    void addContact(Contact contact);
    List<Contact> getAllContacts();
    Contact getContactById(int id);
    boolean updateContact(Contact contact);
    boolean deleteContact(int id);
}
