<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
    	<div class="container">
    		<h1>${msg('emailForgotTitle')}</h1>
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
	    	
	        <form action="${url.loginAction}" method="post">
	        	<div class="form-group">
					<label for="form-input-email" class="form-input-label<#if messagesPerField.existsError('username')> label-error</#if>"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
					<#if !realm.loginWithEmailAllowed>
						<input type="text" id="form-input-email" name="username" class="form-input<#if messagesPerField.existsError('username')> input-error</#if>" value="${(auth.attemptedUsername!'')}" />
					<#elseif !realm.registrationEmailAsUsername>
						<input type="text" id="form-input-email" name="username" class="form-input<#if messagesPerField.existsError('username')> input-error</#if>" value="${(auth.attemptedUsername!'')}" />
					<#else>
						<input type="email" id="form-input-email" name="username" class="form-input<#if messagesPerField.existsError('username')> input-error</#if>" value="${(auth.attemptedUsername!'')}" />
					</#if>
				</div>
				<div class="form-group submit-group">
					<input type="submit" value="${msg("doSubmit")}" id="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"/>
					<a href="${url.loginUrl}" class="back-link">${kcSanitize(msg("backToLogin"))?no_esc}</a>
				</div>
	        </form>
	        <div>
				<p class="body-text">${kcSanitize(msg("emailInstruction"))?no_esc}</p>
			</div>
		</div>
    </#if>
</@layout.registrationLayout>
