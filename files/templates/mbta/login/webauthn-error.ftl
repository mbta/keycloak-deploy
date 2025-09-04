<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true; section>
    <#if section = "header">
        ${kcSanitize(msg("webauthn-error-title"))?no_esc}
    <#elseif section = "form">
    
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

        <script type="text/javascript">
            refreshPage = () => {
                document.getElementById('isSetRetry').value = 'retry';
                document.getElementById('executionValue').value = '${execution}';
                document.getElementById('kc-error-credential-form').requestSubmit();
            }
        </script>

        <form id="kc-error-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
              method="post">
            <input type="hidden" id="executionValue" name="authenticationExecution"/>
            <input type="hidden" id="isSetRetry" name="isSetRetry"/>
        </form>

        <input tabindex="4" onclick="refreshPage()" type="button"
               class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
               name="try-again" id="kc-try-again" value="${kcSanitize(msg("doTryAgain"))?no_esc}"
        />

        <#if isAppInitiatedAction??>
            <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-webauthn-settings-form" method="post">
                <button type="submit"
                        class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                        id="cancelWebAuthnAIA" name="cancel-aia" value="true">${msg("doCancel")}
                </button>
            </form>
        </#if>

    </#if>
</@layout.registrationLayout>