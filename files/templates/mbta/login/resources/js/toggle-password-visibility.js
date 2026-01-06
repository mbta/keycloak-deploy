function togglePasswordVisibility(checkbox, inputIds) {
  const show = checkbox.checked;

  inputIds.forEach((id) => {
    const input = document.getElementById(id);
    if (input) {
      input.type = show ? "text" : "password";
    }
  });
}
