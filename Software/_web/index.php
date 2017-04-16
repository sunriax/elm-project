<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

	if(session_start())	{	$_INDEX	= "index.php";	// Index
												$_SLOTFILE = "slot.init";
		if(	isset($_SERVER['HTTPS']) &&
			 				$_SERVER['HTTPS'] == "on"	)	{	$_LAYER = "https";	}
																		else	{	$_LAYER = "http";		}
												
												date_default_timezone_set('Europe/Vienna');
												$_DATE = date("Ymd", time());
												$_TIME = date("His", time());
											}
								else	{	exit();	}

		// Funktionen und Klassen einbinden
				define("_CLASS",	"./_class/");
			foreach(glob(_CLASS."*inc.php") as $_redirect_FILE)
				{	if(	file_exists($_redirect_FILE)	&&
							is_readable($_redirect_FILE)		)	{	require_once($_redirect_FILE);	}}

		// Sprachpakete einbinden
		define("_LANG",	"./_addon/_speak/");
				foreach(glob(_LANG.SPEAK(false).".inc.php") as $_redirect_FILE)
					{	if(	file_exists($_redirect_FILE)	&&
								is_readable($_redirect_FILE)		)	{	require_once($_redirect_FILE);	}}

		// Konfiguration einbinden
				define("_CONFIG",	"./_addon/_config/");
			foreach(glob(_CONFIG."*inc.php") as $_redirect_FILE)
				{	if(	file_exists($_redirect_FILE)	&&
							is_readable($_redirect_FILE)		)	{	require_once($_redirect_FILE);	}}

		if(	$_EXECUTE == "debug"		)	{	header("Location: index.php?exec=debug");			}
elseif(	$_EXECUTE == "shutdown"	)	{	header("Location: index.php?exec=shutdown");	}
elseif(	$_EXECUTE == "restart"	)	{	header("Location: index.php?exec=restart");		}



if(!empty($_UPLOAD) && $_UPLOAD == true)	{

	if(CONVERT("PICTURE",null,null))
	{	
		header("LOCATION: ".$_INDEX."?adapter=1&errors=none");
	}
	else
	{
		header("LOCATION: ".$_INDEX."?adapter=1&error=1");
	}
}

if($_ACTION == "read")
{
	print_r("Loading to RAM .\n");
	sleep(1);
	print_r(".");
	sleep(1);
	print_r(".");
	sleep(1);
	print_r(".");
	sleep(1);
	print_r(".");
	print_r("Done");
	exit();
}

	head();
		print_r(" </body>");

/*		var_dump($_REQUEST);
		// Abgekürzte IF
		echo ($_GET["do"] == "debug")?"debug":"nix";
		
		$intersts = (isset($_GET['interrest']))?$_POST['interest'] : [];

		$_ARRAY = array("test", "test2", "test3", "test4");

		foreach($_ARRAY as $_TEST)
		{
			echo htmlspecialchars($_TEST)."<br>";
		}
		<?="testasdfasdfasdfasdfasdf"	?>
*/

print_r("	<table class=\"body\">
						<tr>
							<td class=\"head\" colspan=\"7\">
								<table class=\"full\">
										<tr>
											<td class=\"head\" id=\"image\">
												<div align=\"center\">
													&nbsp;
												</div>
											</td>
											<td class=\"head\" id=\"text\">
												<div align=\"right\">
													<h1>"._HEAD."</h1>
													<h2>"._SUBHEAD."</h2>
												</div>
												<div align=\"right\">\n");
													speak(true);
		print_r("						</div>
											</td>
										</tr>
								</table>
							</td>
						</tr>\n");

			menu();

		print_r("	<tr>
							<td class=\"content\" colspan=\"7\">\n");
			if(!empty($_ADAPTER))	{
				if(file_exists(_MODEL.$_SLOT[$_ADAPTER - 1][2].".inc.php"))	{	require_once(_MODEL.$_SLOT[$_ADAPTER - 1][2].".inc.php");		}
																															else	{	if(!empty($_SLOT[$_ADAPTER - 1]))	{	$_SLOT_ERROR_SLOT		 = $_SLOT[$_ADAPTER - 1][0];	
																																																					$_SLOT_ERROR_NAME		 = $_SLOT[$_ADAPTER - 1][1];
																																																					$_SLOT_ERROR_PATH		 = _MODEL.$_SLOT[$_ADAPTER - 1][2].".inc.php";
																																																					$_SLOT_ERROR_VERSION = $_SLOT[$_ADAPTER - 1][3];
																																																					$_SLOT_ERROR_STATUS	 = $_SLOT[$_ADAPTER - 1][4];
																																																					$_SLOT_ERROR_ADDRESS = $_SLOT[$_ADAPTER - 1][5];
																																																					$_SLOT_ERROR_CONSOLE = $_SLOT[$_ADAPTER - 1][6];	}
																																																	else	{	$_SLOT_ERROR_SLOT		 = "Slot not found!";
																																																					$_SLOT_ERROR_NAME		 = "Name not found!";
																																																					$_SLOT_ERROR_PATH		 = "Pfad nicht gefunden";
																																																					$_SLOT_ERROR_FILE		 = "File not found!";																																																					$_SLOT_ERROR_FILE		 = $_SLOT[$_ADAPTER - 1][2];
																																																					$_SLOT_ERROR_VERSION = "Version not found!";	
																																																					$_SLOT_ERROR_ADDRESS = "Address not found";
																																																					$_SLOT_ERROR_CONSOLE = "Console not found";	}
					print_r("	<div align=\"center\">
											<table>
												<tr>
													<td colspan=\"2\">
														<div align=\"center\" class=\"text\" id=\"red\">
															<b>Modell nicht vorhanden</b>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div align=\"right\" class=\"text\">
															<b>Name:</b>
														</div>
													</td>
													<td>
														<div align=\"left\" class=\"text\">
															".$_SLOT_ERROR_NAME."
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div align=\"right\" class=\"text\">
															<b>Slot:</b>
														</div>
													</td>
													<td>
														<div align=\"left\" class=\"text\">
															".$_SLOT_ERROR_SLOT."
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div align=\"right\" class=\"text\">
															<b>Version:</b>
														</div>
													</td>
													<td>
														<div align=\"left\" class=\"text\">
															".$_SLOT_ERROR_VERSION."
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div align=\"right\" class=\"text\">
															<b>Status:</b>
														</div>
													</td>
													<td>
														<div align=\"left\" class=\"text\">
															".$_SLOT_ERROR_STATUS."
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div align=\"right\" class=\"text\">
															<b>Adresse:</b>
														</div>
													</td>
													<td>
														<div align=\"left\" class=\"text\">
															".$_SLOT_ERROR_ADDRESS."
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div align=\"right\" class=\"text\">
															<b>Console:</b>
														</div>
													</td>
													<td>
														<div align=\"left\" class=\"text\">
															".$_SLOT_ERROR_CONSOLE."
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div align=\"right\" class=\"text\">
															<b>Path:</b>
														</div>
													</td>
													<td>
														<div align=\"left\" class=\"text\">
															".$_SLOT_ERROR_PATH."
														</div>
													</td>
												</tr>
											</table>
										
										</div>");	}
			}
										else	{

		print_r("		<table class=\"content\">
									<tr>
										<td class=\"blank\" colspan=\"5\">
											&nbsp;
										</td>
									</tr>
									<tr>
											<td class=\"subcontent\" id=\"head1\">
												<div align=\"center\" class=\"menu\">
													<b>Global</b>
												</div>
											</td>
											<td class=\"blank\">
												&nbsp;
											</td>
											<td class=\"subcontent\" id=\"head2\">
												<div align=\"center\" class=\"menu\">
													<b>Arietta G25</b>
												</div>
											</td>
											<td class=\"blank\">
												&nbsp;
											</td>
											<td class=\"subcontent\" id=\"head3\">
												<div align=\"center\" class=\"menu\">
													<b>Mainboard</b>
												</div>
											</td>
									</tr>
									<tr>
										<tr>
											<td class=\"subcontent\" id=\"text\">
												<table class=\"full\">
													<tr>
														<td colspan=\"2\">
															<div align=\"center\" class=\"text\">
																<b>System</b>
															</div>
														</td>
													</tr>\n");

			for($i=0; $i < count($_SYSTEM); $i++)
			{
					print_r("	<tr>
											<td>
												<div align=\"right\" class=\"text\">
													<b>".$_SYSTEM[$i][0].":</b>
												</div>
											</td>
											<td>
												<div align=\"left\" class=\"text\">
													".$_SYSTEM[$i][1]."
												</div>
											</td>
										</tr>\n");
			}
		print_r("								<tr>
														<td colspan=\"2\">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td colspan=\"2\">
															<div align=\"center\" class=\"text\">
																<b>Unterst&uuml;tzte Module</b>
															</div>
														</td>
													</tr>\n");
			for($i=0; $i < count($_SUPPORT); $i++)
			{
				if($_SUPPORT[$i][1] == true)	{
					print_r("	<tr>
											<td>
												<div align=\"right\" class=\"text\">
													<b>".$_SUPPORT[$i][0].":</b>
												</div>
											</td>
											<td>
												<div align=\"left\" class=\"text\">
													Unterst&uuml;tzt
												</div>
											</td>
										</tr>\n");	}
			}

		print_r("						</table>
											</td>
											<td class=\"blank\">
												&nbsp;
											</td>
											<td class=\"subcontent\" id=\"text\">
												<table class=\"full\">
													<tr>
														<td colspan=\"2\">
															<div align=\"center\" class=\"text\">
																<b>Server/Client</b></b>
															</div>
														</td>
													</tr>\n");

			for($i=0; $i < count($_GLOBAL); $i++)
			{
					print_r("	<tr>
											<td>
												<div align=\"right\" class=\"text\">
													<b>".$_GLOBAL[$i][0].":</b>
												</div>
											</td>
											<td>
												<div align=\"left\" class=\"text\">
													".substr($_GLOBAL[$i][1], 0, 14)."...
												</div>
											</td>
										</tr>\n");
			}

		print_r("							<tr>
														<td colspan=\"2\">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td colspan=\"2\">
															<div align=\"center\" class=\"text\">
																<b>Tools</b></b>
															</div>
														</td>
													</tr>\n");
													
			for($i=0; $i < count($_TOOLS); $i++)
			{
					print_r("	<tr>
											<td>
												<div align=\"right\" class=\"text\">
													<b>".$_TOOLS[$i][0].":</b>
												</div>
											</td>
											<td>
												<div align=\"left\" class=\"text\">
													<input type=\"button\" value=\"Ausf&uuml;hren\" onclick=\"".$_TOOLS[$i][1]."\">
												</div>
											</td>
										</tr>\n");
			}

		print_r("				</table>
											</td>
											<td class=\"blank\">
												&nbsp;
											</td>
											<td class=\"subcontent\" id=\"text\">
												Settings
											</td>
									</tr>
									<td class=\"blank\" colspan=\"5\">
										&nbsp;
									</td>
								</table>\n");
		}
		print_r("	</td>
						</tr>
						<tr>
							<td colspan=\"7\">
								<div align=\"center\" class=\"copyright\">
									"._COPYRIGHT."
								</div>
							</td>
						</tr>
					</table>\n");

print_r("		</body>
					</html>\n");


if($_EXECUTE == 1)	{
		print_r("	<div align=\"center\">
											<form action=\"./console/webconsole.php\" method=\"post\" target=\"_blank\" name=\"login\">
											<table class=\"login\">
												<tr>
													<td>
														<table class=\"menu\">
																<tr>
																	<td class=\"subcontent\" id=\"login\">
																		<div class=\"menu\" align=\"center\">
																			<b>Login</b>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class=\"subcontent\" id=\"text\">
																			<table>
																				<tr>
																					<td>
																						<div align=\"right\" class=\"text\">
																							<b>Benutzer:</b>
																						</div>
																					</td>
																					<td>
																						<input type=\"text\" name=\"USERNAME\">
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<div align=\"right\" class=\"text\">
																							<b>Passwort:</b>
																						</div>
																					</td>
																					<td>
																						<input type=\"password\" name=\"PASSWORD\">
																					</td>
																				</tr>
																				<tr>
																					<td>
																						&nbsp;
																					</td>
																					<td>
																						<input type=\"submit\" value=\"Einloggen\">
																						<input type=\"button\" value=\"Zur&uuml;ck\" onclick=\"location.href=('index.php')\">
																					</td>
																				</tr>
																			</table>
																	</td>
																</tr>
														</table>
													</td>
												</tr>
											</table>
										</form>
										</div>
										
										</div>
								</body>
							</html>\n");
	exit();
}