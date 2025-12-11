const colors = ["#B3000F", "#AE440D", "#A8880B", "#63880A", "#1E8709"];
const successColor = "#DFF0D8";
const regularBackgroundColor = "#F4F5F7";
const whiteBackground = "#FFFFFF";
const buttonDisabledColor = "#626a73";
const STRENGTH_MAX = 5;

function checkPasswordStrength(password, passwordStrengthStrings) {
  // TODO: Need to work feedback into translations still
  const { score, feedback } = zxcvbn(password);
  const container = document.getElementById("strengthContainer");
  const label = document.querySelector(".strength-label");

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

  const isStrongPassword = score > 2;
  label.classList.toggle("complete", isStrongPassword);
  container.style.background = isStrongPassword
    ? successColor
    : regularBackgroundColor;
  const submitButton = document.getElementById("submit");
  submitButton.disabled = !isStrongPassword;

  document.getElementById("strengthValue").textContent =
    passwordStrengthStrings[score];
  document.getElementById("strengthWarning").textContent = feedback.warning;
  document.getElementById("strengthSuggestions").textContent =
    feedback.suggestions.join(" ");
}
