<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

$_SYSTEM = array	(
									array("Linux",			"not avilable on Windows"),
									array("Kernel",			"not avilable on Windows"),
									array("Firmware",		"v1.0_alpha@Fynn"),
									array("Interface",	"Build 1024.201610-24"),
									);

$_GLOBAL = array	(	
									array("Webserver",		$_SERVER["SERVER_SOFTWARE"]),
									array("Server IP",		$_SERVER["SERVER_ADDR"]),
									array("Remote IP",		$_SERVER["REMOTE_ADDR"]),
									);

$_SUPPORT = array	(
									array("PHP", 				true),	array("MySQL", 			false),
									array("postgreSQL", false),	array("Python", 		true),
									array("openSSL",		false),	array("Ruby",				false),
									array("QT",					true),	array("Bash",				true)
									);

$_TOOLS = array		(
									array("SSH client",	"window.open('http://172.26.10.4:4200/', '', 'width=700,height=400')",			true),
									array("Debug",			"location.href('".$_INDEX."?do=debug')",		true),
									array("Syslog",			"location.href('".$_INDEX."?do=syslog')",		true)
									);


$_VGASND = array(	"MAX_Xres"	=>	1280,			// max. Auflösung X
									"MAX_Yres"	=>	1024,			// max. Auflösung Y
									"MAX_size"	=>	(4096 * 1024 * 8)	);	// max. Bildgröße in Bit
									
$_VGASND_DATA = ls(_UPLOAD);