<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

function initfile($_LOADFILE)
{
	// Prüfen ob Datei existiert
	if( !empty($_LOADFILE) &&
			file_exists($_LOADFILE)	)
	{
		// Datei öffnen
		$_FILE = fopen($_LOADFILE, "r");
		$_LINE = 0;

		// Datei auslesen und in Array schreiben
		while(!feof($_FILE))
		{
				$_STRING = fgets($_FILE);
			if(strpos($_STRING, "//") === false)
			{
				$_LINE_ARRAY[$_LINE] = explode("|", $_STRING);
				$_LINE++;
			}
		}

		// Datei schließen
		fclose($_FILE);

	// Array ausgeben
	return $_LINE_ARRAY;
	}
	else
	{
		// Fehler ausgeben
		return false;
	}
}