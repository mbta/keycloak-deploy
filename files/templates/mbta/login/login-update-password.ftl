<#import "template.ftl" as layout>
<#import "show_password.ftl" as show_password>
<#import "password_strength.ftl" as password_strength>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
    	<div class="container" role="main">
    		<h1>${msg('emailSetPasswordTitle')}</h1>
    		<div class="form-group">
	    		<div class="form-message-container form-info" role="alert">
	            	<strong class="form-message-summary">${msg('resetpassword.info.title')}</strong>
	            	<ul>
	                	<li class="form-message-text">${msg('resetpassword.info.uppercase')}</li>
	                	<li class="form-message-text">${msg('resetpassword.info.lowercase')}</li>
	                	<li class="form-message-text">${msg('resetpassword.info.number')}</li>
	                	<li class="form-message-text">${msg('resetpassword.info.specialchar')}</li>
	            	</ul>
	            </div>
	        </div>
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
				<#if message.type = 'warning' && message.summary != msg('resetPasswordMessage') && message.summary != msg('updatePasswordMessage')>
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
	        <form action="${url.loginAction}" class="form" method="post">
	            <input type="text" id="username" name="username" value="${username}" autocomplete="username"
	                   readonly="readonly" style="display:none;"/>
	            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>
	
	            <div class="form-group">
					<label for="password-new" class="form-input-label<#if messagesPerField.existsError('password')> label-error</#if>">${msg("passwordNew")}</label>
	               
					<input type="password" id="password-new" name="password-new" class="form-input<#if messagesPerField.existsError('password')> input-error</#if>"
						autofocus autocomplete="new-password"
						aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
            oninput="checkPasswordStrength(
              this.value,
              [${msg("passwordStrength.zero")}, ${msg("passwordStrength.one")}, ${msg("passwordStrength.two")}, ${msg("passwordStrength.three")}, ${msg("passwordStrength.four")}]
            )"
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

              <div class="form-group-small">
                <@show_password.input_group onchange="togglePasswordVisibility(this, ['password-new', 'password-confirm'])" />
              </div>

	            <div class="form-group-small">
                <@password_strength.password_strength_feedback/>
	            </div>
	
	            <div class="form-group">
	            	<#if isAppInitiatedAction??>
	                	<input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked> ${msg("logoutOtherSessions")}
	                </#if>
	            </div>
	
	            <div class="form-group submit-group">
					<#if isAppInitiatedAction??>
						<input type="submit" value="${msg("doSubmitResetPassword")}" id="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" />
						<button id="cancel" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
					<#else>
						<input type="submit" value="${msg("doSubmitResetPassword")}" id="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" />
					</#if>
	            </div>
	        </form>
		</div>
	    <script src="${url.resourcesPath}/js/toggle-password-visibility.js"></script>
    </#if>
</@layout.registrationLayout>
