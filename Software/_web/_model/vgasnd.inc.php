<?PHP	/*	elmProject v1.0
					OpenSource GPL/LGPL v3.0	*/



print_r("	<div align=\"center\">	
						<table class=\"content\">
									<tr>
										<td class=\"blank\" colspan=\"3\">
											&nbsp;
										</td>
									</tr>
									<tr>
											<td class=\"displaycontent\" id=\"head1\">
												<div align=\"center\" class=\"menu\">
													<b>VGA Interface</b>
												</div>
											</td>
											<td class=\"blank\">
												&nbsp;
											</td>
											<td class=\"displaycontent\" id=\"head2\">
												<div align=\"center\" class=\"menu\">
													<b>Sound</b>
												</div>
											</td>
									</tr>
									<tr>
											<td class=\"subcontent\">
												<div align=\"center\">
													<table>
														<tr>
															<td>
																<div align=\"center\">
																	<form name=\"PICupload\" action=\"".$_INDEX."?adapter=1&upload=1\" method=\"post\" enctype=\"multipart/form-data\">
																		<div align=\"center\" class=\"upload\">
																			<input type=\"hidden\" name=\"UPLOAD\" value=\"1\">
																			<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"".($_VGASND["MAX_size"] * 1024)."\" />
																			<input type=\"file\" name=\"PICTURE\" accept=\"image/*\">
																		</div>
																		<div align=\"center\" class=\"upload\">
																			<input type=\"submit\" value=\"Hochladen\">
																		</div>
																	</form>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																<div align=\"center\" class=\"text\" id=\"red\">
																	max. zulässige Dateigröße ".($_VGASND["MAX_size"]/(1024 * 8))." kByte, sowie<br />max. zulässige Auflösung ".$_VGASND["MAX_Xres"]."x".$_VGASND["MAX_Yres"]."
																</div>
															</td>
														</tr>
														<tr>
															<td>
																<div align=\"center\">
																	<table>
																		<tr>
																			<td>
																				<div align=\"center\" class=\"text\">
																					automatisch übertragen
																				</div>
																			</td>
																			<td>
																				<div align=\"center\" class=\"text\">
																					<input type=\"checkbox\" name=\"REFRESH\">
																				</div>
																			</td>
																			<td>
																				<div align=\"center\" class=\"text\">
																					alle
																				</div>
																			</td>
																			<td>
																				<div align=\"center\" class=\"text\">
																					<input type=\"textbox\" name=\"TIME\" placeholder=\"30\" id=\"small\">
																				</div>
																			</td>
																			<td>
																				<div align=\"center\" class=\"text\">
																					Sekunden
																				</div>
																			</td>
																			<td>
																				&nbsp;&nbsp;
																			</td>
																			<td width=\"100\">
																					<div id=\"Progress\">
																						<div id=\"Bar\">
																						</div>
																					</div>
																			</td>
																		</tr>
																	</table>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																<div align=\"center\">
																	<table>
																		<tr>
																			<td class=\"uline\">
																				<div align=\"center\" class=\"text\">
																					vorhandene Bilder
																				</div>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<div align=\"center\" class=\"text\">\n");
																					listRAW($_VGASND_DATA);
	print_r("															</div>
																			</td>
																		</tr>
																	</table>
																</div>
															</td>
														</tr>
													</table>
												</div>
											</td>
											<td class=\"blank\">
												&nbsp;
											</td>
											<td class=\"subcontent\">
												<div align=\"center\" class=\"text\">
													<b>Interface</b>
												</div>
											</td>
									</tr>
									<tr>
										<td class=\"blank\" colspan=\"3\">
											&nbsp;
										</td>
									</tr>
						</table>
					</div>\n");