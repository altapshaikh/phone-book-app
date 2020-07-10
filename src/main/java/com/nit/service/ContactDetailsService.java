package com.nit.service;

import java.util.List;

import com.nit.beans.ContactDetails;

public interface ContactDetailsService {
public boolean save(ContactDetails details);
public boolean delete(int id);
public ContactDetails update(int id);
public List<ContactDetails>allContact();
}
