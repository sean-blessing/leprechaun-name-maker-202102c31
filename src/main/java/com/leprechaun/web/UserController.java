package com.leprechaun.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.leprechaun.business.FirstNameTranslation;
import com.leprechaun.business.LastNameTranslation;
import com.leprechaun.business.User;
import com.leprechaun.db.FirstNameTranslationRepo;
import com.leprechaun.db.LastNameTranslationRepo;
import com.leprechaun.db.UserRepo;

@CrossOrigin
@RestController
@RequestMapping("/api/users")
public class UserController {
	
	@Autowired
	private UserRepo userRepo;
	@Autowired
	private FirstNameTranslationRepo fntRepo;
	@Autowired
	private LastNameTranslationRepo lntRepo;
	
	@GetMapping("/")
	public List<User> getAll() {
		return userRepo.findAll();
	}
	
	@PostMapping("/")
	public User create(@RequestBody User u) {
		// generate leprechaun name
		// first letter of firstname = firstNameTranslation
		String firstLetter = u.getFirstName().substring(0, 1);
		// get FirstNameTranslation by firstLetter
		FirstNameTranslation fnt = fntRepo.findByLetter(firstLetter);
		// birthMonth = lastNameTranslation
		LastNameTranslation lnt = lntRepo.findByBirthMonth(u.getBirthMonth());
		
		String leprechaunName = fnt.getTranslation() + " " + lnt.getTranslation();
		u.setLeprechaunName(leprechaunName);
		return userRepo.save(u);
	}

}
