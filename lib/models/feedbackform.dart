class FeedbackForm {
	String _entryID;
	String _user;
	String _project;
	String _room;
	String _componentGroup;
	String _component;
	String _condition;
	String _defect;
	String _action;
	String _photo1;
	String _photo2;
	String _photo3;
	String _photo4;

	FeedbackForm(this._entryID, this._user, this._project, this._room, this._componentGroup, this._component, this._condition, this._defect, this._action, this._photo1, this._photo2, this._photo3, this._photo4);

	String toParams() => "?entryID=$_entryID&?user=$_user&?project=$_project&?room=$_room&?componentGroup=$_componentGroup&?component=$_component&?condition=$_condition&?defect=$_defect&?action=$_action&?photo1=$_photo1&?photo2=$_photo2&?photo3=$_photo3&?photo4=$_photo4";
}