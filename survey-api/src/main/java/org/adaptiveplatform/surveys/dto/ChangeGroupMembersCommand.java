package org.adaptiveplatform.surveys.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.adaptiveplatform.adapt.commons.validation.constraints.ValidId;
import org.adaptiveplatform.codegenerator.api.RemoteObject;

/**
 * @author Marcin Derylo
 */
@RemoteObject
public class ChangeGroupMembersCommand implements Serializable {

	private Long groupId;
	/**
	 * Emails of the users to be removed from the group.
	 */
	private List<String> removeMembers = new ArrayList<String>();
	private List<AddGroupMemberCommand> addMembers = new ArrayList<AddGroupMemberCommand>();

	public ChangeGroupMembersCommand() {
	}
	
	public ChangeGroupMembersCommand(Long groupId, AddGroupMemberCommand... addMembers) {
		this.groupId = groupId;
		this.addMembers = Arrays.asList(addMembers);
	}

	public List<AddGroupMemberCommand> getAddMembers() {
		return addMembers;
	}

	public void setAddMembers(List<AddGroupMemberCommand> addMembers) {
		this.addMembers = addMembers;
	}

	@ValidId
	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public List<String> getRemoveMembers() {
		return removeMembers;
	}

	public void setRemoveMembers(List<String> removeMembers) {
		this.removeMembers = removeMembers;
	}
}
