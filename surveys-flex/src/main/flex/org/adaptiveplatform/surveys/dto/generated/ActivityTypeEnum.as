package org.adaptiveplatform.surveys.dto.generated {

	import org.adaptiveplatform.surveys.Enum;
	
	/**
	 * NOTE: This file is autogenerated and will be overwritten every time.
	 */	
	[RemoteClass(alias="org.adaptiveplatform.surveys.dto.ActivityTypeEnum")]
	public class ActivityTypeEnum extends Enum {

		public static const RESEARCH:ActivityTypeEnum = new ActivityTypeEnum("RESEARCH");
		public static const SURVEY_TEMPLATE:ActivityTypeEnum = new ActivityTypeEnum("SURVEY_TEMPLATE");

		public function ActivityTypeEnum(name:String = null) {
			super(name);
		}
	}
}