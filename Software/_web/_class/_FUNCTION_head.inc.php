<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

	function head(	$_FUNCTION_head_css3 = true,
									$_FUNCTION_head_java = true,
									$_FUNCTION_head_menu = false	)	{	global $_INDEX, $_TITLE;
							print_r("<!DOCTYPE html>\n");
							print_r("<html>\n");
							print_r("	<head>\n");
							print_r("		<title>"._TITLE."</title>\n");
			if(	$_FUNCTION_head_css3 == true	)	{
				if(	file_exists(_ICON)	)		{	print_r("		<link rel=\"icon\" href=\""._ICON."\" type=\"image/vnd.microsoft.icon\" />\n");
																			print_r("		<link rel=\"shortcut icon\" href=\""._ICON."\" type=\"image/vnd.microsoft.icon\" />\n");	}
					foreach(glob(_STYLE."*.css") as $_FUNCTION_head_css3_FILE)	{
						if(file_exists($_FUNCTION_head_css3_FILE))	{
							print_r("		<link rel=\"stylesheet\" type=\"text/css\" href=\"".$_FUNCTION_head_css3_FILE."\" />\n");	}}	}
			if(	$_FUNCTION_head_java == true	)	{
					foreach(glob(_SCRIPT."*.js") as $_FUNCTION_head_java_FILE)	{
						if(file_exists($_FUNCTION_head_java_FILE))	{
							print_r("		<script type=\"text/javascript\" src=\"".$_FUNCTION_head_java_FILE."\" language=\"JavaScript\"></script>\n");	}}	}
							print_r("	</head>\n\n");
							print_r("	<body>\n");
			if(	$_FUNCTION_head_menu == true	)	{

				}}
?>