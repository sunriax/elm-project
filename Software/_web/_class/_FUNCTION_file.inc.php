<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

	function ls($_FOLDER)	{
		if(!empty($_FOLDER))	{
				if($_HANDLE = opendir($_FOLDER))	{
						$i = 0;
					while(false !== ($_ENTRY = readdir($_HANDLE)))	{
						if($_ENTRY != "." && $_ENTRY != "..")
						{
							$_INFO = pathinfo($_ENTRY);
							$_ARRAY[$i] = array($_FOLDER, $_INFO['basename'], $_INFO['filename'], $_INFO['extension']);
							$i++;
						}
					}
					if(!isset($_ARRAY))	{	return false;	}
												else	{	return $_ARRAY;		}
				closedir($_HANDLER);
				}
			else	{	return false;	}}}
