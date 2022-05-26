<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
    	<div class="container">
			<h1>${msg("loginAccountTitle")}</h1>
			<#if realm.password>
	        	<#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
					<#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span>
						<div class="form-group">
		                    <div class="form-message-container form-success" role="alert">
		                        <strong class="form-message-summary">${msg('message.success')}</strong>
		                        <ul>
		                            <#list message.summary?split("<br>") as oneMessage>
										<li class="form-message-text">${kcSanitize(oneMessage)?no_esc}</li>
									</#list>
		                        </ul>                    
		                    </div>
		                </div>
					</#if>
					<#if message.type = 'warning'>
						<div class="form-group">
		                    <div class="form-message-container form-warning" role="alert">
		                        <strong class="form-message-summary">${msg('message.warning')}</strong>
		                        <ul>
		                            <#list message.summary?split("<br>") as oneMessage>
										<li class="form-message-text">${kcSanitize(oneMessage)?no_esc}</li>
									</#list>
		                        </ul>
		                    </div>
		                </div>
					</#if>
					<#if message.type = 'error'>
						<div class="form-group">
							<div class="form-message-container form-error" role="alert">
								<strong class="form-message-summary">${msg('message.error')}</strong>
								<ul>
									<#list message.summary?split("<br>") as oneMessage>
										<li class="form-message-text">${kcSanitize(oneMessage)?no_esc}</li>
									</#list>
								</ul>
							</div>
						</div>
					</#if>
					<#if message.type = 'info'>
						<div class="form-group">
		                    <div class="form-message-container form-info" role="alert">
		                        <strong class="form-message-summary">${msg('message.info')}</strong>
		                        <ul>
		                            <#list message.summary?split("<br>") as oneMessage>
										<li class="form-message-text">${kcSanitize(oneMessage)?no_esc}</li>
									</#list>
		                        </ul>
		                    </div>
		                </div>
					</#if>	
				</#if>
				
	            <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
	            	<div class="form-group">
                        <label class="form-input-label" for="form-input-email"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                        <#if usernameEditDisabled??>
	                        <input id="form-input-email" class="form-input" name="username" value="${(login.username!'')}" type="email" disabled />
	                    <#else>
	                        <input id="form-input-email" class="form-input" name="username" value="${(login.username!'')}" type="email" autofocus autocomplete="off" />
	                    </#if>
                    </div>
                    <div class="form-group">
                        <label for="form-input-password" class="form-input-label">${msg("password")}</label>
                    	<input id="form-input-password" class="form-input" name="password" type="password" autocomplete="off" />
                    </div>
                    <div class="form-group submit-group">
                    	<#if realm.resetPasswordAllowed>
							<a href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
						</#if>
						
						<input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
	                    <input name="login" id="sign-in" type="submit" value="${msg("doLogIn")}" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"/>
                    </div>
                    
                    <div>
						<#if realm.password && realm.registrationAllowed && !registrationDisabled??>
							<span class="body-text">${msg("noAccount")}</span> <a href="${url.registrationUrl}">${msg("doRegister")}</a>
			        	</#if>
			        	<#if realm.password && social.providers??>
				        	<hr/>
				            <span class="body-text">${msg("identity-provider-login-label")} </span>
							<#list social.providers as p>
				             	<a href="${p.loginUrl}">${p.displayName!}</a>
				            </#list>
				        </#if>
			        </div>
	            </form>
			</#if>
		</div>
    </#if>
</@layout.registrationLayout>
