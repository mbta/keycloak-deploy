<#macro password_strength_feedback>
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


  <script src="${url.resourcesPath}/js/zxcvbn.js"></script>
  <script src="${url.resourcesPath}/js/password-strength.js"></script>
</#macro>
