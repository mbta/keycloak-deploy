<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
	<link href="${url.resourcesPath}/css/stylesheet.css?v=1.1.0" rel="stylesheet" />
	<script src="${url.resourcesPath}/js/jquery-3.6.4.min.js"></script>
	<script type="importmap">
        {
            "imports": {
                "rfc4648": "${url.resourcesCommonPath}/vendor/rfc4648/rfc4648.js"
            }
        }
    </script>
    <script src="${url.resourcesPath}/js/menu-button-links.js" type="module"></script>
    <script type="module">
        import { startSessionPolling } from "${url.resourcesPath}/js/authChecker.js";

        startSessionPolling(
            "${url.ssoLoginInOtherTabsUrl?no_esc}"
        );
    </script>
    <#if authenticationSession??>
        <script type="module">
            import { checkAuthSession } from "${url.resourcesPath}/js/authChecker.js";

            checkAuthSession(
                "${authenticationSession.authSessionIdHash}"
            );
        </script>
    </#if>
</head>

<body>
	<div class="page-content">
		<img id="logo" src="${url.resourcesPath}/img/MBTA_logo_text.svg" alt="Massachusetts Bay Transportation Authority logo">
		
		<#nested "form">
	
		<#if displayInfo>
			<#nested "info">
		</#if>
	</div>
</body>
</html>
</#macro>
