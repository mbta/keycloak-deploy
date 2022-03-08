<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
    	<div class="container">
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
	        <form action="${url.loginAction}" method="post">
	            <input type="text" id="username" name="username" value="${username}" autocomplete="username"
	                   readonly="readonly" style="display:none;"/>
	            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>
	
	            <div class="form-group">
					<label for="password-new" class="form-input-label<#if messagesPerField.existsError('password')> label-error</#if>">${msg("passwordNew")}</label>
	               
					<input type="password" id="password-new" name="password-new" class="form-input<#if messagesPerField.existsError('password')> input-error</#if>"
						autofocus autocomplete="new-password"
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
	            
					<input type="password" id="password-confirm" name="password-confirm"
						class="form-input<#if messagesPerField.existsError('password-confirm')> input-error</#if>"
						autocomplete="new-password"
						aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
					/>
	
					<#if messagesPerField.existsError('password-confirm')>
						<span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
							${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
						</span>
					</#if>
	            </div>
	
	            <div class="form-group">
	            	<#if isAppInitiatedAction??>
	                	<input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked> ${msg("logoutOtherSessions")}
	                </#if>
	            </div>
	
	            <div class="form-group submit-group">
					<#if isAppInitiatedAction??>
						<input type="submit" value="${msg("doSubmit")}" id="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" />
						<button type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
					<#else>
						<input type="submit" value="${msg("doSubmit")}" id="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" />
					</#if>
	            </div>
	        </form>
		</div>
    </#if>
</@layout.registrationLayout>