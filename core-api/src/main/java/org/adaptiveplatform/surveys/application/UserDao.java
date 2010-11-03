package org.adaptiveplatform.surveys.application;

import java.util.List;

import org.adaptiveplatform.codegenerator.api.RemoteService;
import org.adaptiveplatform.surveys.dto.UserDto;
import org.adaptiveplatform.surveys.dto.UserQuery;

@RemoteService
public interface UserDao {
	UserDto getUser(Long id);

	UserDto getByEmail(String email);

	List<UserDto> query(UserQuery query);
}
