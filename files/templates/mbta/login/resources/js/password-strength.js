const colors = ["#B3000F", "#AE440D", "#A8880B", "#63880A", "#1E8709"];
const successColor = "#DFF0D8";
const regularBackgroundColor = "#F4F5F7";
const whiteBackground = "#FFFFFF";
const buttonDisabledColor = "#626a73";
const STRENGTH_MAX = 5;
const MIN_PASSWORD_LENGTH = 12;
const MIN_PASSWORD_STRENGTH = 3;

function checkPasswordStrength(password, passwordStrengthStrings) {
  // TODO: Need to work feedback into translations still
  const { score, feedback } = zxcvbn(password);
  const container = document.getElementById("strengthContainer");
  const label = document.querySelector(".strength-label");

  validatePills(password);
  if (!password || password.trim() === "") {
    container.style.display = "none";
    return;
  }
  container.style.display = "block";

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
  document.getElementById("strengthWarning").textContent = feedback.warning;
  document.getElementById("strengthSuggestions").textContent =
    feedback.suggestions.join(" ");
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
  if (conditionMet) {
    pill.classList.add("complete");
  } else {
    pill.classList.remove("complete");
  }
}
