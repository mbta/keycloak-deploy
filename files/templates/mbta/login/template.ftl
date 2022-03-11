<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <title>${msg("loginTitle",(realm.displayName!''))}</title> <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
	<link href="${url.resourcesPath}/css/stylesheet.css" rel="stylesheet" />
</head>

<body>
	<div class="page-content">
		<img id="logo" src="${url.resourcesPath}/img/MBTA_logo_text.svg" alt="MBTA logo">
		
		<#nested "form">
	
		<#if displayInfo>
			<#nested "info">
		</#if>
	</div>
</body>
</html>
</#macro>
