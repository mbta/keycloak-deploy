<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
    	<div class="container" role="main">
    		<h1>${msg("registerTitle")}</h1>
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
			
	        <form action="${url.registrationAction}" method="post">
	        
	            <@userProfileCommons.userProfileFormFields; callback, attribute>
	                <#if callback = "afterField">
		                <#-- render password fields just under the username or email (if used as username) -->
			            <#if passwordRequired?? && (attribute.name == 'username' || (attribute.name == 'email' && realm.registrationEmailAsUsername))>
			                <div class="form-group">
								<label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label> *
	
			                        <input type="password" id="password" class="${properties.kcInputClass!}" name="password"
			                               autocomplete="new-password"
			                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
			                        />
			
			                        <#if messagesPerField.existsError('password')>
			                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
			                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
			                            </span>
			                        </#if>
			                </div>
			
			                <div class="form-group">
			                        <label for="password-confirm"
			                               class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label> *
	
			                        <input type="password" id="password-confirm" class="${properties.kcInputClass!}"
			                               name="password-confirm"
			                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
			                        />
			
			                        <#if messagesPerField.existsError('password-confirm')>
			                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
			                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
			                            </span>
			                        </#if>
			                </div>
			            </#if>
	                </#if>  
	            </@userProfileCommons.userProfileFormFields>
	            
	            <#if recaptchaRequired??>
	                <div class="form-group">
	                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
	                </div>
	            </#if>
	            
	            <div class="form-group submit-group">
					<input type="submit" value="${msg("doRegister")}" id="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"/>
					<a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
				</div>
	        </form>
		</div>
    </#if>
</@layout.registrationLayout>
