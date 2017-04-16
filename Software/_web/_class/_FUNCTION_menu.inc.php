<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

function menu($_TYPE = true)	{	global $_ADAPTER, $_SLOT;
	print_r("	<tr>\n");

		for($i = 0; $i < count($_SLOT); $i++)
		{
			if(!empty($_SLOT[$i][1]))	{
				if($_ADAPTER == ($i+1))	{	$_menuID = "on";	}
													else	{	$_menuID = "cn";	}
																			$_menuTEXT = $_SLOT[$i][1];
				print_r("	<td class=\"menu\" id=\"".$_menuID."\">
										<div align=\"center\" class=\"menu\">\n");
			if($_ADAPTER == ($i+1))	{	print_r($_menuTEXT);	}
												else	{
				print_r("			<a href=\"index.php?adapter=".($i+1)."\" target=\"_self\">
												".$_menuTEXT."
											</a>\n");	}
				print_r("		</div>
									</td>");	}
															else	{	$_menuID = "nc";
																			$_menuTEXT = _EMPTY;
				print_r("	<td class=\"menu\" id=\"".$_menuID."\">
													<div align=\"center\" class=\"menu\">
														".$_menuTEXT."
													</div>
												</td>\n");	}
		}
			if(empty($_ADAPTER))	{	$_menuID = "on_setting";	}
											else	{	$_menuID = "cn_setting";	}
		print_r("		<td class=\"menu\" id=\"".$_menuID."\">
									<div align=\"center\" class=\"menu\">\n");
			if(!empty($_ADAPTER))	{
				print_r("			<a href=\"index.php\" target=\"_self\">
												"._SETTING."
											</a>\n");	}
											else	{	print_r(_SETTING);	}
		print_r("			</div>
								</td>\n");
		
	print_r("	</tr>\n");
}
