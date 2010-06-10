package org.adaptiveplatform.surveys.exception.security;

import org.adaptiveplatform.codegenerator.api.Param;
import org.adaptiveplatform.codegenerator.api.RemoteException;
import org.adaptiveplatform.surveys.exception.BusinessException;

/**
 *
 * @author Marcin Deryło
 */
@RemoteException
public class EmailAddressAlreadyRegisteredException extends BusinessException {

    public static final String ERROR_CODE = "EMAIL_ALREADY_REGISTERED";

    public EmailAddressAlreadyRegisteredException(@Param("email") String email) {
        super(ERROR_CODE, "User already exists with email \"{0}\".", email);
    }
}
