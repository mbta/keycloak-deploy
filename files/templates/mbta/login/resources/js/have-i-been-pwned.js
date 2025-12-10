// Taken and modified from https://github.com/zxcvbn-ts/zxcvbn/blob/master/packages/libraries/pwned/src/haveIBeenPwned.ts
const HAVE_I_BEEN_PWNED_API_URL = "https://api.pwnedpasswords.com/range/";
const PASSWORD_HASH_START = 0;
const PASSWORD_HASH_END = 5;
let latestPromise;
const exposedPasswordWarning =
  zxcvbnts.core.zxcvbnOptions.translations.warnings.pwned;
const exposedPasswordSuggestion =
  zxcvbnts.core.zxcvbnOptions.translations.suggestions.pwned;

const digestMessage = async (message) => {
  let hash = "";
  const data = new TextEncoder().encode(message);
  const hashBuffer = await crypto.subtle.digest("SHA-1", data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  hash = hashArray
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("")
    .toUpperCase();
  return hash;
};

async function checkPasswordExposed(password) {
  // MIN_PASSWORD_LENGTH defined in check-password-strength.js
  if (!password || password.length < MIN_PASSWORD_LENGTH) {
    return null;
  }

  const currentPromise = checkHaveIBeenPwned(password);
  latestPromise = currentPromise;

  const result = await currentPromise;
  if (latestPromise != currentPromise) return null;

  if (result) {
    updatePasswordStrength(0);
    showWarningAndSuggestion(
      exposedPasswordWarning,
      exposedPasswordSuggestion,
      "strength-exposed",
    );
  }
}

async function checkHaveIBeenPwned(password) {
  const passwordHash = (await digestMessage(password)).toUpperCase();
  const range = passwordHash.slice(PASSWORD_HASH_START, PASSWORD_HASH_END);
  const suffix = passwordHash.slice(PASSWORD_HASH_END);
  const response = await fetch(`${HAVE_I_BEEN_PWNED_API_URL}${range}`, {
    method: "GET",
    headers: {
      "Add-Padding": "true",
    },
  }).catch((error) => {
    console.error(`Network Error: ${error}`);
    return false;
  });

  if (typeof response === "boolean") {
    return false;
  }

  if (response.status >= 400) {
    console.eror(`Network Error: ${error}`);
    return false;
  }

  const result = await response.text();
  const resultArray = result.split("\r\n");

  return resultArray.find((entry) => {
    const passwordHasPart = entry.split(":")[0];
    return passwordHasPart === suffix;
  });
}
