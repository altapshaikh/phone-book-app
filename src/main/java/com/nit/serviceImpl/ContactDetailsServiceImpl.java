package com.nit.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nit.beans.ContactDetails;
import com.nit.entity.ContactEntity;
import com.nit.repository.ContactRepo;
import com.nit.service.ContactDetailsService;

@Service
public class ContactDetailsServiceImpl implements ContactDetailsService {
	@Autowired
	private ContactRepo repository;

	@Override
	public boolean save(ContactDetails details) {
		boolean isSaved = false;
		ContactEntity entity = new ContactEntity();
		BeanUtils.copyProperties(details, entity);
		ContactEntity save = repository.save(entity);
		if (save.getContactId() > 0) {
			isSaved = true;
		}
		return isSaved;
	}

	@Override
	public boolean delete(int id) {
		repository.deleteById(id);
		boolean existsById = repository.existsById(id);
		return existsById;
	}

	@Override
	public ContactDetails update(int id) {
		Optional<ContactEntity>  entity = repository.findById(id);
		ContactEntity contactEntity = entity.get();
		ContactDetails details=new ContactDetails();
		if(null!=entity) {		
			BeanUtils.copyProperties(contactEntity, details);		
		}	
		return details;	
	}

	@Override
	public List<ContactDetails> allContact() {
		List<ContactEntity> findAll = repository.findAll();
		List<ContactDetails> contactList = new ArrayList<ContactDetails>();
		findAll.forEach(data -> {
			ContactDetails details = new ContactDetails();
			BeanUtils.copyProperties(data, details);
			contactList.add(details);
		});
		return contactList;
	}
}
