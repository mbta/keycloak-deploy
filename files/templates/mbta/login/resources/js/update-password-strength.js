const colors = ["#B3000F", "#AE440D", "#A8880B", "#63880A", "#1E8709"];
const successColor = "#DFF0D8";
const regularBackgroundColor = "#F4F5F7";
const whiteBackground = "#FFFFFF";
const buttonDisabledColor = "#626a73";
const STRENGTH_MAX = 5;
const MIN_PASSWORD_LENGTH = 12;
const MIN_PASSWORD_STRENGTH = 3;
const NUM_WARNINGS = 2;
let passwordStrengthStrings = [];

function setupPasswordStrengthStrings(strengthStrings) {
  passwordStrengthStrings = strengthStrings;
}

function setupZxcvbnTranslations(translations) {
  const options = {
    translations: translations,
    graphs: zxcvbnts["language-common"].adjacencyGraphs,
    dictionary: {
      ...zxcvbnts["language-common"].dictionary,
    },
  };

  zxcvbnts.core.zxcvbnOptions.setOptions(options);
}

function updatePasswordStrength(score) {
  const container = document.getElementById("strengthContainer");
  const label = document.querySelector(".strength-label");

  for (
    let strengthSegmentIndex = 0;
    strengthSegmentIndex < STRENGTH_MAX;
    strengthSegmentIndex++
  ) {
    const segment = document.getElementById(
      `strength-segment-${strengthSegmentIndex}`,
    );
    segment.style.backgroundColor =
      strengthSegmentIndex <= score ? colors[score] : whiteBackground;
  }

  const isStrongPassword = score >= MIN_PASSWORD_STRENGTH;
  label.classList.toggle("complete", isStrongPassword);
  container.style.background = isStrongPassword
    ? successColor
    : regularBackgroundColor;

  document.getElementById("strengthValue").textContent =
    passwordStrengthStrings[score];
}

function showWarningAndSuggestion(warning, suggestion, listElementId) {
  const normalizedWarning = warning || "";
  const listItem = document.getElementById(listElementId);
  if (normalizedWarning != "" || suggestion != "") {
    listItem.style.display = "list-item";
    listItem.innerHTML = `<strong>${normalizedWarning}</strong> ${suggestion}`;
  } else {
    listItem.style.display = "none";
  }
}

function validatePills(password) {
  const requiredUpperPill = document.getElementById("required-upper");
  const requiredLowerPill = document.getElementById("required-lower");
  const requiredNumberPill = document.getElementById("required-number");
  const requiredSpecialPill = document.getElementById("required-special");
  const requiredLengthPill = document.getElementById("required-length");
  const hasUppercase = /[A-Z]/.test(password);
  const hasLowercase = /[a-z]/.test(password);
  const hasNumber = /[0-9]/.test(password);
  const hasSpecialCharacter = /[^A-Za-z0-9]/.test(password);
  const isLongEnough = password.length >= MIN_PASSWORD_LENGTH;

  updatePill(requiredUpperPill, hasUppercase);
  updatePill(requiredLowerPill, hasLowercase);
  updatePill(requiredNumberPill, hasNumber);
  updatePill(requiredSpecialPill, hasSpecialCharacter);
  updatePill(requiredLengthPill, isLongEnough);

  return (
    hasUppercase &&
    hasLowercase &&
    hasNumber &&
    hasSpecialCharacter &&
    isLongEnough
  );
}

function updatePill(pill, conditionMet) {
  pill.classList.remove("error");
  if (conditionMet) {
    pill.classList.add("complete");
  } else {
    pill.classList.remove("complete");
  }
}

function setPillErrors() {
  const pills = [
    document.getElementById("required-upper"),
    document.getElementById("required-lower"),
    document.getElementById("required-number"),
    document.getElementById("required-special"),
    document.getElementById("required-length"),
  ];

  pills.forEach((pill) => {
    pill.classList.add("error");
  });
}
