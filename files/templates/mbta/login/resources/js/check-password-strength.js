function checkPasswordStrength(password) {
  // TODO: Need to work feedback into translations still
  const { score, feedback } = zxcvbnts.core.zxcvbn(password);
  const container = document.getElementById("strengthContainer");

  validatePills(password);
  if (!password || password.trim() === "") {
    container.style.display = "none";
    return;
  }
  container.style.display = "block";

  updatePasswordStrength(score, feedback.warning, feedback.suggestions);
}
