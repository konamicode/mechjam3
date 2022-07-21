// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DialogHelper() constructor
{
	dialog = [];
	
	function LoadDialog()
	{
		var dialogFile = file_text_open_read("dialog.json");
		
		var jsonStr = "";
		while(!file_text_eof(dialogFile))
		{
			jsonStr += file_text_read_string(dialogFile);
			file_text_readln(dialogFile);
		}
		file_text_close(dialogFile);
		return json_parse(jsonStr);
	}

	//TECH DEBT: This will need to account for prerequisites at some point
	function GetDialog(personality, context)
	{
		var availableDialog = ds_list_create();
		
		//Parse dialog
		for(i = 0; i < array_length(dialog); i++)
		{
			var curDialog = dialog[i];
			
			//Determine if the current dialog is fits our needs
			if(curDialog.personality == personality
				and curDialog.context == context)
			{
				ds_list_add(availableDialog, curDialog.text);
			}
		}
		var dialogIdx;
		var dialogStr = "...";
		if (ds_list_size(availableDialog) > 0) {
			dialogIdx = irandom(ds_list_size(availableDialog)-1);
			dialogStr = ds_list_find_value(availableDialog, dialogIdx);
		}
		
		if (dialogStr == undefined) {
			show_debug_message("Couldn't find dialog");	
		} 
		ds_list_destroy(availableDialog);
		return dialogStr;
	}
	
	dialog = LoadDialog();

}

function SpawnDialogText() {
	instance_create_layer(screenWidth/2, screenHeight/2, "GUI", objDialogDrawer);	
}

function DestroyDialogText() {
	if instance_exists(objDialogDrawer)
		with(objDialogDrawer)
			instance_destroy();
			
}