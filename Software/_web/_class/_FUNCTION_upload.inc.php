<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

	function upload($_ARRAY, $_FILENAME, $_EXTENSION, $_FILESIZE = null)	{
		if(!empty($_ARRAY) && !empty($_FILENAME) && !empty($_EXTENSION))
		{
			if(is_dir(_UPLOAD) && is_array($_FILES[$_ARRAY]))
			{
				$_PATHNAME = _UPLOAD.$_FILENAME;
				
				if(	file_exists($_FILES[$_ARRAY]['tmp_name']) &&
						!file_exists($_PATHNAME.$_EXTENSION)	)	{
					if($_FILESIZE > 0 && $_FILES[$_ARRAY]['size'] > $_FILESIZE)	{	return false;	}
					if (move_uploaded_file($_FILES[$_ARRAY]['tmp_name'], $_PATHNAME.$_EXTENSION))
					{
						return true;
					}
					else
					{
						return false;
					}
				}
				else
				{
					return false;
				}
				
			}
			else
			{
				return false;
			}
	}
	else
	{
		return false;
	}}
?>