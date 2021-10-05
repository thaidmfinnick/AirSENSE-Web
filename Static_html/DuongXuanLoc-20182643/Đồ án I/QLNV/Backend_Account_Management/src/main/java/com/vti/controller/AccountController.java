package com.vti.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vti.dto.AccountDto;
import com.vti.entity.Account;
import com.vti.form.AccountFormForCreating;
import com.vti.service.IAccountService;

@RestController
@RequestMapping(value = "api/v1/accounts")
@CrossOrigin("*")
public class AccountController {
	@Autowired
	private IAccountService accountService;

	@GetMapping()
	public ResponseEntity<?> getAllAccount() {

		List<Account> entities = accountService.getAllAccount();

		List<AccountDto> dtos = new ArrayList<>();

		for (Account account : entities) {
			AccountDto dto = new AccountDto(account.getId(), account.getEmail(),account.getUsername(),
					account.getFullname() , account.getDepartment().getName() , account.getPosition().getName().toString() , account.getCreateDate());
					dtos.add(dto);
		}

		return new ResponseEntity<>(dtos, (HttpStatus.OK));
	}

	@GetMapping(value = "/{id}")
	public ResponseEntity<?> getAccountById(@PathVariable(name = "id") short id) {
		Account account = accountService.getAccountById(id);
		AccountDto dto = new AccountDto(account.getId(), account.getEmail(), account.getUsername(),
				account.getFullname(), account.getDepartment().getName(), account.getPosition().getName().toString(),
				account.getCreateDate());

		return new ResponseEntity<>(dto, HttpStatus.OK);
	}

	@PostMapping()
	public ResponseEntity<?> createAccount(AccountFormForCreating form) {
		accountService.createAccount(form);
		return new ResponseEntity<String>("Tạo thành công", HttpStatus.CREATED);
	}

	@PutMapping(value = "/{id}")
	public ResponseEntity<?> updateAccount(@PathVariable(name = "id") short id, AccountFormForCreating form) {
		accountService.updateAccount(id, form);
		return new ResponseEntity<String>("Cập nhật thành công", HttpStatus.OK);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<?> deleteAccount(@PathVariable(name = "id") short id) {
		accountService.deleteAccount(id);
		return new ResponseEntity<String>("Xóa thành công", HttpStatus.OK);
	}

}
