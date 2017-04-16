<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

	function convert(	$_ARRAY, $_FILENAME = null, $_EXTENSION = null	)	{	global $_DATE, $_TIME, $_VGASND;
																																						 	 $_VGA_EXTENSION = ".raw";
		if(empty($_FILENAME))		{	$_FILENAME = $_DATE."_".$_TIME;	}
		if(empty($_EXTENSION))	{	$_EXTENSION = ".jpg";												}
		
		if(	!empty($_ARRAY) && !empty($_FILENAME) && !empty($_EXTENSION))	{
			if(	!file_exists(_UPLOAD.$_FILENAME.$_EXTENSION)	&&
					!file_exists(_UPLOAD.$_FILENAME.$_VGA_EXTENSION)	)	{
				if(upload($_ARRAY, $_FILENAME, $_EXTENSION, $_VGASND["MAX_size"]))
				{
					if(file_exists(_UPLOAD.$_FILENAME.$_EXTENSION))	{
						if(exif_imagetype(_UPLOAD.$_FILENAME.$_EXTENSION) == IMAGETYPE_JPEG)	{
						
							$_SIZE = getimagesize(_UPLOAD.$_FILENAME.$_EXTENSION);		$_WIDTH = $_SIZE[0];
																																				$_HEIGHT = $_SIZE[1];
							if(	!empty($_WIDTH) &&
										$_WIDTH > 10 &&
										$_WIDTH <= $_VGASND["MAX_Xres"] &&
									!empty($_HEIGHT) &&
										$_HEIGHT > 10 &&
										$_HEIGHT <= $_VGASND["MAX_Yres"]	)	{
							
								$_RAW_FILE = fopen(_UPLOAD.$_FILENAME.$_VGA_EXTENSION, "w");
								$_IMAGE = imagecreatefromjpeg(_UPLOAD.$_FILENAME.$_EXTENSION);
									
									for($y=0; $y < $_HEIGHT; $y++)
									{
										for($x=0; $x < $_WIDTH; $x++)
										{
											/* Warnung Abfangen von -1 noch notwendig	*/
											$_RGB_DATA = imagecolorsforindex($_IMAGE, imagecolorat($_IMAGE, $x, $y));
											$_R = $_RGB_DATA["red"];
											$_G = $_RGB_DATA["green"];
											$_B = $_RGB_DATA["blue"];
											
											$_RGB_ARRAY[$y][$x][0] = dechex($_R);
											$_RGB_ARRAY[$y][$x][1] = dechex($_G);
											$_RGB_ARRAY[$y][$x][2] = dechex($_B);
											fwrite($_RAW_FILE, $_RGB_ARRAY[$y][$x][0]."|".$_RGB_ARRAY[$y][$x][1]."|".$_RGB_ARRAY[$y][$x][0]."\n");
										}
									}
								
								fclose($_RAW_FILE);
								return true;
						}
						else
						{
							unlink(_UPLOAD.$_FILENAME.$_EXTENSION);
						}
					}
					
					else
					{
						echo "Datei Upload Fehler";
						return false;
					}}
					else
					{
						echo "Datei Upload Fehler";
						return false;
					}}
				else
				{
					echo 'Upload Fehlgeschalgen';
					return false;
				}}
			else
			{
				echo 'Datei Existiert bereits';
				return false;
			}}
			else
			{
				echo 'Eingabe leer';
				return false;
			}
}
?>