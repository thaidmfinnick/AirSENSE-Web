package com.vti.service;


import java.util.List;


import com.vti.entity.Account;
import com.vti.form.AccountFormForCreating;

public interface IAccountService {
	public List<Account> getAllAccount();
	
	public Account getAccountById(short id);
	
	public void createAccount(AccountFormForCreating form);

	public void updateAccount(short id, AccountFormForCreating form);

	public void deleteAccount(short id);
}
