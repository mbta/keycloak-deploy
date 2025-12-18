<#macro password_strength_feedback>
	<div class="form-group" id=password-strength-container>
    <div class="password-requirements-group" id="password-requirements-group" aria-labelledby="password-requirements-label required-upper required-lower required-number required-special required-length" tabindex="0" role="status">
      <div id="password-requirements-label" class="password-requirements-label">
        <div>${msg("passwordRequirement.label")}</div>
      </div>
      <div id="password-requirements" class="password-requirements">
        <div class="required-pill" id="required-upper">
          <img class="required-pill-icon" id="required-upper-icon" src="${url.resourcesPath}/img/password-incomplete.svg"/>
          <span class="required-pill-text" id="required-upper-text">${msg("passwordRequirement.uppercase")}</span>
        </div>

        <div class="required-pill" id="required-lower">
          <img class="required-pill-icon" id="required-lower-icon" src="${url.resourcesPath}/img/password-incomplete.svg"/>
          <div class="required-pill-text">${msg("passwordRequirement.lowercase")}</div>
        </div>

        <div class="required-pill" id="required-number">
          <img class="required-pill-icon" id="required-number-icon" src="${url.resourcesPath}/img/password-incomplete.svg"/>
          <div class="required-pill-text">${msg("passwordRequirement.number")}</div>
        </div>

        <div class="required-pill" id="required-special">
          <img class="required-pill-icon" id="required-special-icon" src="${url.resourcesPath}/img/password-incomplete.svg"/>
          <div class="required-pill-text">${msg("passwordRequirement.specialCharacter")}</div>
        </div>

        <div class="required-pill" id="required-length">
          <img class="required-pill-icon" id="required-length-icon" src="${url.resourcesPath}/img/password-incomplete.svg"/>
          <div class="required-pill-text">${msg("passwordRequirement.length")}</div>
        </div>
      </div>
    </div>

    <div id="strength-container" class="strength-container" aria-labelledby="strength-label strength-description" tabindex="0">
      <div class="strength-label" id="strength-label">${msg("passwordStrength.text")}&nbsp;<span class="strength-value" id="strengthValue">-</span></div>
      <div class="strength-bar">
        <div class="strength-segment" id="strength-segment-0"></div>
        <div class="strength-segment" id="strength-segment-1"></div>
        <div class="strength-segment" id="strength-segment-2"></div>
        <div class="strength-segment" id="strength-segment-3"></div>
        <div class="strength-segment" id="strength-segment-4"></div>
      </div>
      <ul id="strength-description" class="strength-description">
        <li id="strength-warning" class="strength-warning"></li>
        <li id="strength-exposed" class="strength-warning"></li>
      </ul>
    </div>

    <div id="screen-reader-announcer" class="screen-reader-announcer" aria-live="polite"></div>

    <script src="${url.resourcesPath}/js/zxcvbn-ts.core.min.js"></script>
    <script src="${url.resourcesPath}/js/zxcvbn-ts.language-common.min.js"></script>
    <script src="${url.resourcesPath}/js/update-password-strength.js"></script>
    <script src="${url.resourcesPath}/js/check-password-strength.js"></script>
    <script type="text/javascript">
      const resourcesPath = "${url.resourcesPath}";
      document.getElementById('password-strength-container').style.display = "block";


      <#if messagesPerField.existsError('password')>
        setPillErrors()
      </#if>

      setupPasswordStrengthStrings(
        [${msg("passwordStrength.zero")?no_esc},
        ${msg("passwordStrength.one")?no_esc},
        ${msg("passwordStrength.two")?no_esc},
        ${msg("passwordStrength.three")?no_esc},
        ${msg("passwordStrength.four")?no_esc}]
      )

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
    <script src="${url.resourcesPath}/js/have-i-been-pwned.js"></script>
	</div>
</#macro>
