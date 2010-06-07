package org.adaptiveplatform.surveys.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.adaptiveplatform.codegenerator.api.RemoteObject;


@RemoteObject
public class CreateSurveyTemplateCommand implements Serializable {
	private static final long serialVersionUID = 365832389182162306L;

	private String name;
	private List<QuestionTemplateDto> questions = new ArrayList<QuestionTemplateDto>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<QuestionTemplateDto> getQuestions() {
		return questions;
	}

	public void setQuestions(List<QuestionTemplateDto> questions) {
		this.questions = questions;
	}
}