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

    <script src="${url.resourcesPath}/js/zxcvbn-ts.core.min.js"></script>
    <script src="${url.resourcesPath}/js/zxcvbn-ts.language-common.min.js"></script>
    <script src="${url.resourcesPath}/js/password-strength.js"></script>  
    <script type="text/javascript">
      document.getElementById('password-strength-container').style.display = "block";

      setupZxcvbnTranslations({
        warnings: {
          straightRow: '${msg("passwordRequirement.warning.straightRow")?no_esc}',
          keyPattern: '${msg("passwordRequirement.warning.keyPattern")?no_esc}',
          simpleRepeat: '${msg("passwordRequirement.warning.simpleRepeat")?no_esc}',
          extendedRepeat: '${msg("passwordRequirement.warning.extendedRepeat")?no_esc}',
          sequences: '${msg("passwordRequirement.warning.sequences")?no_esc}',
          recentYears: '${msg("passwordRequirement.warning.recentYears")?no_esc}',
          dates: '${msg("passwordRequirement.warning.dates")?no_esc}',
          topTen: '${msg("passwordRequirement.warning.topTen")?no_esc}',
          topHundred: '${msg("passwordRequirement.warning.topHundred")?no_esc}',
          common: '${msg("passwordRequirement.warning.common")?no_esc}',
          similarToCommon: '${msg("passwordRequirement.warning.similar")?no_esc}',
          wordByItself: '${msg("passwordRequirement.warning.wordByItself")?no_esc}',
          namesByThemselves: '${msg("passwordRequirement.warning.namesByThemselves")?no_esc}',
          commonNames: '${msg("passwordRequirement.warning.commonNames")?no_esc}',
          userInputs: '${msg("passwordRequirement.warning.userInputs")?no_esc}',
          pwned: '${msg("passwordRequirement.warning.pwned")?no_esc}'
        },
        suggestions: {
          l33t: '${msg("passwordRequirement.suggestion.l33t")?no_esc}',
          reverseWords: '${msg("passwordRequirement.suggestion.reverseWord")?no_esc}',
          allUppercase: '${msg("passwordRequirement.suggestion.allUppercase")?no_esc}',
          capitalization: '${msg("passwordRequirement.suggestion.capitalization")?no_esc}',
          dates: '${msg("passwordRequirement.suggestion.dates")?no_esc}',
          recentYears: '${msg("passwordRequirement.suggestion.recentYears")?no_esc}',
          associatedYears: '${msg("passwordRequirement.suggestion.associatedYears")?no_esc}',
          sequences: '${msg("passwordRequirement.suggestion.sequences")?no_esc}',
          repeated: '${msg("passwordRequirement.suggestion.repeated")?no_esc}',
          longerKeyboardPattern: '${msg("passwordRequirement.suggestion.longerKeyboardPattern")?no_esc}',
          anotherWord: '${msg("passwordRequirement.suggestion.anotherWord")?no_esc}',
          useWords: '${msg("passwordRequirement.suggestion.useWords")?no_esc}',
          noNeed: '${msg("passwordRequirement.suggestion.noNeed")?no_esc}',
          pwned: '${msg("passwordRequirement.suggestion.pwned")?no_esc}'
        },
        timeEstimation: {
          ltSecond: "less than a second",
          second: "{base} second",
          seconds: "{base} seconds",
          minute: "{base} minute",
          minutes: "{base} minutes",
          hour: "{base} hour",
          hours: "{base} hours",
          day: "{base} day",
          days: "{base} days",
          month: "{base} month",
          months: "{base} months",
          year: "{base} year",
          years: "{base} years",
          centuries: "centuries",
        },
      });
    </script>
	</div>
</#macro>
