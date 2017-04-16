<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/

		$_SLOT = initfile($_SLOTFILE);

		$_ACTION_ARRAY = array(		"read"		=>	true,
															"listen"	=>	true	);
		$_EXECUTE_ARRAY = array(	"login"		=>	true	);
		$_ADAPTER_ARRAY = array(	"1"	=>	true,
															"2"	=>	true,
															"3"	=>	true,
															"4"	=>	true	);
		$_UPLOAD_ARRAY = array(		"1"	=>	true	);

	if(isset($_REQUEST["action"]))	{	if(!empty($_ACTION_ARRAY[htmlspecialchars($_REQUEST["action"])]))	{	$_ACTION = htmlspecialchars($_REQUEST["action"]);	}
																																																else	{	$_ACTION = null;	}}
														else	{	$_ACTION = null;	}

	if(isset($_REQUEST["execute"]))	{	if(!empty($_EXECUTE_ARRAY[htmlspecialchars($_REQUEST["execute"])]))	{	$_EXECUTE = $_EXECUTE_ARRAY[htmlspecialchars($_REQUEST["execute"])];	}
																																																	else	{	$_EXECUTE = null;	}}
														else	{	$_EXECUTE = null;	}

	if(isset($_REQUEST["adapter"]))	{	if(!empty($_ADAPTER_ARRAY[htmlspecialchars($_REQUEST["adapter"])]))	{	$_ADAPTER = htmlspecialchars($_REQUEST["adapter"]);	}
																																																	else	{	$_ADAPTER = null;	}}
														else	{	$_ADAPTER = null;	}

	if(isset($_REQUEST["upload"]))	{	if(!empty($_UPLOAD_ARRAY[htmlspecialchars($_REQUEST["upload"])]))	{	$_UPLOAD = htmlspecialchars($_REQUEST["upload"]);	}
																																																	else	{	$_UPLOAD = null;	}}
														else	{	$_UPLOAD = null;	}
