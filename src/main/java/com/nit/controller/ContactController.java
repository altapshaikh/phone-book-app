package com.nit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nit.beans.ContactDetails;
import com.nit.service.ContactDetailsService;

@Controller
public class ContactController {
	@Autowired
	private ContactDetailsService service;
 final static String contact="contact";
	@GetMapping(value = { "/", "register" })
	public String loadPage(Model model) {
		ContactDetails details = new ContactDetails();
		model.addAttribute(contact, details);
		return "contact-info";
	}

	@PostMapping(value = "/register")
	public String registerContacts(@ModelAttribute("contact") ContactDetails details, Model model) {
		if (details.getContactName() != null && !details.getContactName().equals("")) {
			boolean save = service.save(details);
			if (save) {
				if (details.getContactId() > 0) {
					model.addAttribute("succMag", "Contact Updated Successfully");
				} else {
					model.addAttribute("succMag", "Contact Register Successfully");
				}
			} else {
				model.addAttribute("errMag", "Contact Not Registred");
			}

		}
		model.addAttribute(contact, new ContactDetails());
		return "contact-info";
	}

	@GetMapping("/viewcontacts")
	public String viewAllContact(Model model) {
		List<ContactDetails> allContact = service.allContact();
		model.addAttribute("contactlist", allContact);
		return "view-Contacts";
	}

	@GetMapping(value = "/edit/{id}")
	public String editContact(@PathVariable("id") Integer id, Model model) {
		ContactDetails details = service.update(id);
		model.addAttribute(contact, details);
		return "contact-info";
	}

	@GetMapping(value = "/delete/{id}")
	public String deleteContact(@PathVariable("id") Integer id, RedirectAttributes attributes) {
		boolean delete = service.delete(id);
		if (!delete) {
			attributes.addFlashAttribute("succMag", "Contact deleted Successfully");
		}
		return "redirect:/viewcontacts";
	}
}
