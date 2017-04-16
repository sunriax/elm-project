<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/


		function SPEAK($_FUNCTION_LANGUAGE_type)	{	global $_LAYER, $_INDEX;
			if(isset($_GET["speak"]))					{	$_FUNCTION_LANGUAGE_newlang = htmlspecialchars($_GET["speak"]);					}
			if(isset($_SESSION["language"]))	{	$_FUNCTION_LANGUAGE_session = htmlspecialchars($_SESSION["language"]);	}
																	else	{	$_SESSION["language"] = "de_AT";	}

				// Überprüfen ob Sprache gewählt
				if(			!empty($_FUNCTION_LANGUAGE_newlang)	)	{	$_FUNCTION_LANGUAGE_lang = $_FUNCTION_LANGUAGE_newlang;	}
				elseif(	!empty($_FUNCTION_LANGUAGE_session)	)	{	$_FUNCTION_LANGUAGE_lang = $_FUNCTION_LANGUAGE_session;	}
																								else	{	$_FUNCTION_LANGUAGE_lang = "de_AT";		/* FALLBACK	*/		}

					// Verfügbare Plattformsprachen
					$_FUNCTION_LANGUAGE_ARRAY = array(	"de_AT"	=>	"de_AT",
																							"en_GB"	=>	"en_GB",
																							"es_ES"	=>	"es_ES"	);
					
					// Zählbaren Array erstellen
					$_FUNCTION_LANGUAGE_NUMARRAY = array_values($_FUNCTION_LANGUAGE_ARRAY);

					// Sprache auswerten und übernehmen
					$_FUNCTION_LANGUAGE_exec = $_FUNCTION_LANGUAGE_ARRAY[$_FUNCTION_LANGUAGE_lang];

			// Auswahl der Ausgabe (Rückgabewert)
			if($_FUNCTION_LANGUAGE_type == false)	{
				if(!empty($_FUNCTION_LANGUAGE_exec))	{	$_SESSION["language"]  = $_FUNCTION_LANGUAGE_lang;
																								return $_FUNCTION_LANGUAGE_exec;										}
																				else	{	$_FUNCTION_LANGUAGE_exec = "de_AT";	
																								return $_FUNCTION_LANGUAGE_exec;										}}
																			else	{
				
				print_r("	<select onchange=\"this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);\">
										<option>"._SPEAK_SELECT."</option>\n");
				for($i = 0; $i < count($_FUNCTION_LANGUAGE_NUMARRAY); $i++)
					print_r("		<option value=\"index.php?speak=".$_FUNCTION_LANGUAGE_NUMARRAY[$i]."\">"._SPEAK[$i]."</option>\n");
				print_r("	</select>\n");	}
		}
