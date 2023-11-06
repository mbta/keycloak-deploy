<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('email','firstName','lastName','user.attributes.phone_number'); section>
    <#if section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
    	<div class="container" role="main">
    		<h1>${msg("loginProfileTitle")}</h1>
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
	                <label for="email" class="form-input-label<#if messagesPerField.existsError('email')> label-error</#if>">${msg("email")}</label>
	                <input type="text" id="email" name="email" value="${(user.email!'')}"
	                	class="form-input<#if messagesPerField.existsError('email')> input-error</#if>
	                    aria-invalid="<#if messagesPerField.existsError('email')>true</#if>" <#if user.email?? && user.email?contains("@mbta.com")>readonly style="border-color: #999; color: #999;"</#if>
	                />
	
	                <div class="instructions-container">
		               	<#if messagesPerField.existsError('email')>
			               	<span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
			                   	${kcSanitize(messagesPerField.get('email'))?no_esc}
			                </span>
			            <#else>
			            	${msg("updateprofile.email.info")}
			            </#if>
		              </div>
	            </div>
	
	            <div class="form-group">
	                <label for="firstName" class="form-input-label<#if messagesPerField.existsError('firstName')> label-error</#if>">${msg("firstName")}</label>
	                <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}"
	                	class="form-input<#if messagesPerField.existsError('firstName')> input-error</#if>
	                    aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
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
	            	<label for="lastName" class="form-input-label<#if messagesPerField.existsError('lastName')> label-error</#if>">${msg("lastName")}</label>
	                <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}"
						class="form-input<#if messagesPerField.existsError('lastName')> input-error</#if>
						aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
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
	            	<label for="user.attributes.phone_number" class="form-input-label<#if messagesPerField.existsError('user.attributes.phone_number')> label-error</#if>">${msg("user.attributes.phone_number")}  <span>${msg("user.attributes.phone_number.span")}</label>
	                <div class="input-group">
	                	<label class="visually-hidden" for="user.attributes.areacode">${msg("countryCode")}</label>
		                <select id="user.attributes.areacode" class="form-select<#if messagesPerField.existsError('user.attributes.phone_number')> input-error</#if>" name="user.attributes.areacode">
		                    	<option value="+1">US / +1</option>
		                </select>
		                <input type="tel" id="user.attributes.phone_number" name="user.attributes.phone_number" value="${(user.attributes.phone_number!'')}"
							class="form-input<#if messagesPerField.existsError('user.attributes.phone_number')> input-error</#if> placeholder="###-###-####"
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
	
	            <div class="form-group submit-group">
	            	<#if isAppInitiatedAction??>
		            	<input id="submit" type="submit" value="${msg("doSubmitUpdateProfile")}" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" />
		                <button id="cancel" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
	                <#else>
	                	<input id="submit" type="submit" value="${msg("doSubmitUpdateProfile")}" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" />
	                </#if>
	            </div>
	        </form>
		</div>
    </#if>
</@layout.registrationLayout>
