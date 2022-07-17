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
		
		return json_parse(jsonStr);
	}

	//TECH DEBT: This will need to account for prerequisites at some point
	function GetDialog(personality, context)
	{
		availableDialog = ds_list_create();
		
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
		
		var dialogIdx = irandom(ds_list_size(availableDialog)-1);
		var dialogStr = ds_list_find_value(availableDialog, dialogIdx);
		ds_list_destroy(availableDialog);
		return dialogStr;
	}
	
	dialog = LoadDialog();

}