package org.adaptiveplatform.surveys.exception;

import java.io.Serializable;

/**
 *
 * @author Marcin Deryło
 */
public class OutsideOfFillingPeriodException extends BusinessException
        implements Serializable {

    public static final String ERROR_CODE = "OUTSIDE_OF_FILLING_PERIOD";

    public OutsideOfFillingPeriodException(Long filledSurveyId,
            Long publicationId) {
        super(ERROR_CODE, "Filled survey ID={0} cannot be filled at the moment,"
                + " because survey publication ID={1} is outside it's filling "
                + "period", filledSurveyId, publicationId);
    }
}
