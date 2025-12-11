function checkPasswordStrength(password) {
  const { score, feedback } = zxcvbnts.core.zxcvbn(password);
  const container = document.getElementById("strength-container");

  validatePills(password);
  if (!password || password.trim() === "") {
    container.style.display = "none";
    return;
  }
  container.style.display = "block";

  document.getElementById(`strength-exposed`).style.display = "none";
  updatePasswordStrength(score);
  showWarningAndSuggestion(
    feedback.warning,
    feedback.suggestions.join(" "),
    "strength-warning",
  );
}
