<#import "template.ftl" as layout>
<#import "show_password.ftl" as show_password>
<#import "password_strength.ftl" as password_strength>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm','user.attributes.phone_number'); section>
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
			
	        <form id="register-form" action="${url.registrationAction}" method="post">
	            <div class="form-group">
	                    <label for="firstName" class="form-input-label<#if messagesPerField.existsError('firstName')> label-error</#if>">${msg("firstName")} <span aria-hidden="true">${msg("requiredText")}</span></label>
	                    <input type="text" id="firstName" class="form-input<#if messagesPerField.existsError('firstName')> input-error</#if>" name="firstName"
	                           value="${(register.formData.firstName!'')}"
	                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                             required
	                    />
	
	                    <#if messagesPerField.existsError('firstName')>
	                    	<div class="instructions-container">
		                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
		                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
		                        </span>
	                        </div>
	                    </#if>
	            </div>
	
	            <div class="form-group">
	                    <label for="lastName" class="form-input-label<#if messagesPerField.existsError('lastName')> label-error</#if>">${msg("lastName")} <span aria-hidden="true">${msg("requiredText")}</span></label>
	                    <input type="text" id="lastName" class="form-input<#if messagesPerField.existsError('lastName')> input-error</#if>" name="lastName"
	                           value="${(register.formData.lastName!'')}"
	                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                             required
	                    />
	
	                    <#if messagesPerField.existsError('lastName')>
	                        <div class="instructions-container">
		                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
		                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
		                        </span>
	                        </div>
	                    </#if>
	            </div>
	
	            <div class="form-group">
	                    <label for="email" class="form-input-label<#if messagesPerField.existsError('email')> label-error</#if>">${msg("email")} <span aria-hidden="true">${msg("requiredText")}</label>
	                    <input type="text" id="email" class="form-input<#if messagesPerField.existsError('email')> input-error</#if>" name="email"
	                           value="${(register.formData.email!'')}" autocomplete="email"
	                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                             required
	                    />
	                    
	                    <#if messagesPerField.existsError('email')>
	                        <div class="instructions-container">
		                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
		                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
		                        </span>
		                    </div>
	                    </#if>
	            </div>
	            
	            <div class="form-group">
	                    <label for="user.attributes.phone_number" class="form-input-label<#if messagesPerField.existsError('user.attributes.phone_number')> label-error</#if>">${msg("user.attributes.phone_number")} <span>${msg("user.attributes.phone_number.span")?no_esc}</span></label>
	                    <div class="input-group">
	                    	<label class="visually-hidden" for="user.attributes.areacode">${msg("countryCode")}</label>
		                    <select id="user.attributes.areacode" class="form-select<#if messagesPerField.existsError('user.attributes.phone_number')> input-error</#if>" name="user.attributes.areacode">
		                    	<option value="+1">US / +1</option>
		                    </select>
		                    <input type="tel" id="user.attributes.phone_number" class="form-input<#if messagesPerField.existsError('user.attributes.phone_number')> input-error</#if>" name="user.attributes.phone_number"
		                           value="${(register.formData['user.attributes.phone_number']!'')}" autocomplete="user.attributes.phone_number" placeholder="###-###-####"
		                           aria-invalid="<#if messagesPerField.existsError('user.attributes.phone_number')>true</#if>"
		                    />
		                </div>
	                    
	                    <#if messagesPerField.existsError('user.attributes.phone_number')>
	                        <div class="instructions-container">
		                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
		                            ${kcSanitize(messagesPerField.get('user.attributes.phone_number'))?no_esc}
		                        </span>
		                    </div>
	                    </#if>
	            </div>
	
	            <#if !realm.registrationEmailAsUsername>
	                <div class="form-group">
	                        <label for="username" class="form-input-label<#if messagesPerField.existsError('username')> label-error</#if>">${msg("username")} <span aria-hidden="true">${msg("requiredText")}</span></label>
	                        <input type="text" id="username" class="form-input<#if messagesPerField.existsError('username')> input-error</#if>" name="username"
	                               value="${(register.formData.username!'')}" autocomplete="username"
	                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                 required
	                        />
	
	                        <#if messagesPerField.existsError('username')>
	                            <div class="instructions-container">
		                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
		                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
		                            </span>
		                        </div>
	                        </#if>
	                </div>
	            </#if>
	
	            <#if passwordRequired??>
	                <div class="form-group">
	                        <label for="password" class="form-input-label<#if messagesPerField.existsError('password')> label-error</#if>">${msg("password")} <span aria-hidden="true">${msg("requiredText")}</span></label>
	                        <input type="password" id="password" class="form-input<#if messagesPerField.existsError('password')> input-error</#if>" name="password"
                                 aria-describedby="password-requirements-label password-requirements"
	                               autocomplete="new-password"
	                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                 oninput="checkPasswordStrength(this.value)",
                                 onblur="checkPasswordExposed(this.value)",
                                 required
	                        />
	
                          <noscript>
                            <#if messagesPerField.existsError('password')>
                              <div class="password-requirements-list-error">
                                <div class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${msg("resetpassword.info.title")}
                                </div>
                                <ul class="error-list">
                                    <li>${msg("resetpassword.info.uppercase")}</li>
                                    <li>${msg("resetpassword.info.lowercase")}</li>
                                    <li>${msg("resetpassword.info.number")}</li>
                                    <li>${msg("resetpassword.info.specialchar")}</li>
                                </ul>
                              </div>
                            <#else>
                                <div class="password-requirements-list">
                                    ${msg("resetpassword.info.title")}
                                    <ul>
                                      <li>${msg("resetpassword.info.uppercase")}</li>
                                      <li>${msg("resetpassword.info.lowercase")}</li>
                                      <li>${msg("resetpassword.info.number")}</li>
                                      <li>${msg("resetpassword.info.specialchar")}</li>
                                    </ul>
                                </div>
                            </#if>
                          </noscript>
	                </div>

                  <@password_strength.password_strength_feedback />
	
	                <div class="form-group">
	                        <label for="password-confirm" class="form-input-label<#if messagesPerField.existsError('password-confirm')> label-error</#if>">${msg("passwordConfirm")} <span aria-hidden="true">${msg("requiredText")}</span></label>
	                        <input type="password" id="password-confirm" class="form-input<#if messagesPerField.existsError('password-confirm')> input-error</#if>"
	                               name="password-confirm"
	                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                 required
	                        />
	
	                        <#if messagesPerField.existsError('password-confirm')>
	                            <div class="instructions-container">
		                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
		                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
		                            </span>
		                        </div>
	                        </#if>
	                </div>
 
                  <@show_password.input_group onchange="togglePasswordVisibility(this, ['password', 'password-confirm'])" />

	                <div class="form-group-small" aria-describedby="terms_of_use" tabindex="0">
                      <div class="terms-of-use-title">${msg("termsOfUseTitle")}</div>
                      <div class="terms-of-use-description">${msg("termsOfUseDescription")?no_esc}</div>
						          <div class="checkbox-input-group">
	                        <input type="checkbox" id="terms_of_use" class="form-input-checkbox <#if messagesPerField.existsError('terms_of_use')> input-error</#if>"
	                               name="terms_of_use"
	                               aria-invalid="<#if messagesPerField.existsError('terms_of_use')>true</#if>"
                                 required
	                        />
	                        <label for="terms_of_use" class="form-input-label-not-bold<#if messagesPerField.existsError('terms_of_use')> label-error</#if>">${msg("termsOfUse")?no_esc} <span aria-hidden="true">${msg("requiredText")}</span></label>
	                    </div>
	                </div>
	            </#if>
	
	            <#if recaptchaRequired??>
	                <div class="form-group">
	                    <div class="${properties.kcInputWrapperClass!}">
	                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
	                    </div>
	                </div>
	            </#if>
	            
	            <div class="form-group hidden">
	            	<input type="text" value="" class="form-input" name="token" id="token">
	            </div>
	            
	            <div class="form-group hidden">
	            	<input type="checkbox" class="form-input" name="robot" id="robot">
	            </div>
	            
	            <div class="form-group submit-group">
					<input type="submit" value="${msg("doRegister")}" id="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"/>
					<a href="${url.loginUrl}" class="back-link">${kcSanitize(msg("backToLoginRegistration"))?no_esc}</a>
				</div>
	        </form>
	        
	        <script src="${url.resourcesPath}/js/toggle-password-visibility.js"></script>
	        <script src="${url.resourcesPath}/js/form-registration.js"></script>
		</div>
    </#if>
</@layout.registrationLayout>
