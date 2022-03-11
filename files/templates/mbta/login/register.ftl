<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
    	<div class="container">
    		<h1>${msg("registerTitle")}</h1>
			<#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
				<#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span>
					<div class="form-group">
	                    <div class="form-message-container form-success" role="alert">
	                        <strong class="form-message-summary">${msg('message.success')}</strong>
	                        <ul>
	                            <li class="form-message-text">${kcSanitize(message.summary)?no_esc}</li>
	                        </ul>                    
	                    </div>
	                </div>
				</#if>
				<#if message.type = 'warning'>
					<div class="form-group">
	                    <div class="form-message-container form-warning" role="alert">
	                        <strong class="form-message-summary">${msg('message.warning')}</strong>
	                        <ul>
	                            <li class="form-message-text">${kcSanitize(message.summary)?no_esc}</li>
	                        </ul>
	                    </div>
	                </div>
				</#if>
				<#if message.type = 'error'>
					<div class="form-group">
						<div class="form-message-container form-error" role="alert">
							<strong class="form-message-summary">${msg('message.error')}</strong>
							<ul>
								<li class="form-message-text">${kcSanitize(message.summary)?no_esc}</li>
							</ul>
						</div>
					</div>
				</#if>
				<#if message.type = 'info'>
					<div class="form-group">
	                    <div class="form-message-container form-info" role="alert">
	                        <strong class="form-message-summary">${msg('message.info')}</strong>
	                        <ul>
	                            <li class="form-message-text">${kcSanitize(message.summary)?no_esc}</li>
	                        </ul>
	                    </div>
	                </div>
				</#if>	
			</#if>
			
	        <form action="${url.registrationAction}" method="post">
	            <div class="form-group">
	                    <label for="firstName" class="form-input-label<#if messagesPerField.existsError('firstName')> label-error</#if>">${msg("firstName")}</label>
	                    <input type="text" id="firstName" class="form-input<#if messagesPerField.existsError('firstName')> input-error</#if>" name="firstName"
	                           value="${(register.formData.firstName!'')}"
	                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
	                    />
	
	                    <#if messagesPerField.existsError('firstName')>
	                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
	                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
	                        </span>
	                    </#if>
	            </div>
	
	            <div class="form-group">
	                    <label for="lastName" class="form-input-label<#if messagesPerField.existsError('lastName')> label-error</#if>">${msg("lastName")}</label>
	                    <input type="text" id="lastName" class="form-input<#if messagesPerField.existsError('lastName')> input-error</#if>" name="lastName"
	                           value="${(register.formData.lastName!'')}"
	                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
	                    />
	
	                    <#if messagesPerField.existsError('lastName')>
	                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
	                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
	                        </span>
	                    </#if>
	            </div>
	
	            <div class="form-group">
	                    <label for="email" class="form-input-label<#if messagesPerField.existsError('email')> label-error</#if>">${msg("email")}</label>
	                    <input type="text" id="email" class="form-input<#if messagesPerField.existsError('email')> input-error</#if>" name="email"
	                           value="${(register.formData.email!'')}" autocomplete="email"
	                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
	                    />
	
	                    <#if messagesPerField.existsError('email')>
	                        <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
	                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
	                        </span>
	                    </#if>
	            </div>
	
	            <#if !realm.registrationEmailAsUsername>
	                <div class="form-group">
	                        <label for="username" class="form-input-label<#if messagesPerField.existsError('username')> label-error</#if>">${msg("username")}</label>
	                        <input type="text" id="username" class="form-input<#if messagesPerField.existsError('username')> input-error</#if>" name="username"
	                               value="${(register.formData.username!'')}" autocomplete="username"
	                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
	                        />
	
	                        <#if messagesPerField.existsError('username')>
	                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
	                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
	                            </span>
	                        </#if>
	                </div>
	            </#if>
	
	            <#if passwordRequired??>
	                <div class="form-group">
	                        <label for="password" class="form-input-label<#if messagesPerField.existsError('password')> label-error</#if>">${msg("password")}</label>
	                        <input type="password" id="password" class="form-input<#if messagesPerField.existsError('password')> input-error</#if>" name="password"
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
	                        <label for="password-confirm" class="form-input-label<#if messagesPerField.existsError('password-confirm')> label-error</#if>">${msg("passwordConfirm")}</label>
	                        <input type="password" id="password-confirm" class="form-input<#if messagesPerField.existsError('password-confirm')> input-error</#if>"
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
	
	            <#if recaptchaRequired??>
	                <div class="form-group">
	                    <div class="${properties.kcInputWrapperClass!}">
	                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
	                    </div>
	                </div>
	            </#if>
	            
	            <div class="form-group submit-group">
					<input type="submit" value="${msg("doRegister")}" id="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"/>
					<a href="${url.loginUrl}" class="back-link">${kcSanitize(msg("backToLogin"))?no_esc}</a>
				</div>
	        </form>
		</div>
    </#if>
</@layout.registrationLayout>