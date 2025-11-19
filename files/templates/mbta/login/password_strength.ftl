<#macro password_strength_feedback>
	<div class="form-group-small" id=password-strength-container style="display: none">
    <div id="strengthContainer" class="strength-container">
      <div class="strength-label">${msg("passwordStrength.text")}&nbsp;<span class="strength-value" id="strengthValue">-</span></div>
      <div class="strength-bar">
        <div class="strength-segment" id="strength-segment-0"></div>
        <div class="strength-segment" id="strength-segment-1"></div>
        <div class="strength-segment" id="strength-segment-2"></div>
        <div class="strength-segment" id="strength-segment-3"></div>
        <div class="strength-segment" id="strength-segment-4"></div>
      </div>
      <div id="strengthWarning" class="strength-feedback"></div>
      <div id="strengthSuggestions" class="strength-feedback"></div>
    </div>
    <div id="passwordRequirements" class="password-requirements">
      <div class="required-pill" id="required-upper">${msg("passwordRequirement.uppercase")}</div>
      <div class="required-pill" id="required-lower">${msg("passwordRequirement.lowercase")}</div>
      <div class="required-pill" id="required-number">${msg("passwordRequirement.number")}</div>
      <div class="required-pill" id="required-special">${msg("passwordRequirement.specialCharacter")}</div>
      <div class="required-pill" id="required-length">${msg("passwordRequirement.length")}</div>
    </div>

    <script src="${url.resourcesPath}/js/zxcvbn.js"></script>
    <script src="${url.resourcesPath}/js/password-strength.js"></script>
    <script type="text/javascript">
      document.getElementById('password-strength-container').style.display = "block"
    </script>
	</div>
</#macro>
