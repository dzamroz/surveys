package org.adaptiveplatform.surveys.service;

import org.adaptiveplatform.surveys.domain.UserAccount;

public interface UserAccountRepository {

	void persist(UserAccount account);

	UserAccount get(Long userId);

	UserAccount get(String email);

	UserAccount getExisting(Long userId);

	UserAccount getExisting(String email);
}
