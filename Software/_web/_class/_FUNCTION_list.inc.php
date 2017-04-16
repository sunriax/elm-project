<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

	function listRAW($_LIST)	{	global $_INDEX;
		if(!empty($_LIST) && is_array($_LIST))	{
			for($i = 0; $i < count($_LIST); $i++)	{
				if(file_exists($_LIST[$i][0].$_LIST[$i][1]))
				{
					if($_LIST[$i][3] == "jpg")	{
						for($j = 0; $j < count($_LIST); $j++)	{
							if($_LIST[$j][2] == $_LIST[$i][2] && $_LIST[$j][3] == "raw")	{
									print_r("	<div align=\"center\" class=\"image\">
															<br />
															<div align=\"center\">
																<img src=\"".$_LIST[$i][0].$_LIST[$i][1]."\" width=\"100\" border=\"0\">
															</div>
															<div align=\"center\" id=\"".$i."\">
																<button onclick=\"loadDoc('".$_INDEX."', 'action=read', '".$i."'); move('Bar');\"> 
																	Transmit
																</button>
															</div>
															<br />
														</div>&nbsp;&nbsp;\n");
								}
							}
				}
				}
			}
			
		}
	}