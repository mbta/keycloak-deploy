<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("confirmLinkIdpTitle")}
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
	        	<div class="button-group">
		        	<button type="submit" class="button button-wide" name="submitAction" id="updateProfile" value="updateProfile">${msg("confirmLinkIdpReviewProfile")}</button>
	                <button type="submit" class="button" name="submitAction" id="linkAccount" value="linkAccount">${msg("confirmLinkIdpContinue", idpDisplayName)}</button>
               	</div>
	        </form>
		</div>
    </#if>
</@layout.registrationLayout>
