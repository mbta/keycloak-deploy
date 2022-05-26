<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','email','firstName','lastName'); section>
    <#if section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
    	<div class="container">
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
			
			<form action="${url.loginAction}" method="post">
	            <#if user.editUsernameAllowed>
	            	<div class="form-group">
		                <label for="username" class="form-input-label<#if messagesPerField.existsError('username')> label-error</#if>">${msg("username")}</label>
		                <input type="text" id="username" name="username" 
		                	value="${(user.username!'')}"
		                	class="form-input<#if messagesPerField.existsError('username')> input-error</#if>
		                    aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
		                />
	
	                    <#if messagesPerField.existsError('username')>
							<span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
								${kcSanitize(messagesPerField.get('username'))?no_esc}
							</span>
						</#if>
	                </div>
	            </#if>
	            <div class="form-group">
	                <label for="email" class="form-input-label<#if messagesPerField.existsError('email')> label-error</#if>">${msg("email")}</label>
	                <input type="text" id="email" name="email" value="${(user.email!'')}"
	                	class="form-input<#if messagesPerField.existsError('email')> input-error</#if>
	                    aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
	                />
	
	                <#if messagesPerField.existsError('email')>
	                	<span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
	                    	${kcSanitize(messagesPerField.get('email'))?no_esc}
	                    </span>
	                </#if>
	            </div>
	
	            <div class="form-group">
	                <label for="firstName" class="form-input-label<#if messagesPerField.existsError('firstName')> label-error</#if>">${msg("firstName")}</label>
	                <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}"
	                	class="form-input<#if messagesPerField.existsError('firstName')> input-error</#if>
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
	                <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}"
						class="form-input<#if messagesPerField.existsError('lastName')> input-error</#if>
						aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
					/>
	
					<#if messagesPerField.existsError('lastName')>
						<span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
							${kcSanitize(messagesPerField.get('lastName'))?no_esc}
						</span>
					</#if>
	            </div>
	
	            <div class="form-group submit-group">
	            	<#if isAppInitiatedAction??>
		            	<input id="submit" type="submit" value="${msg("doSubmit")}" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" />
		                <button type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
	                <#else>
	                	<input id="submit" type="submit" value="${msg("doSubmit")}" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" />
	                </#if>
	            </div>
	        </form>
		</div>
    </#if>
</@layout.registrationLayout>
