<#macro input_group onchange>
  <div class="checkbox-input-group">
    <input id="show-password-checkbox" class="form-input-checkbox" type="checkbox" onchange="${onchange}"/>
    <label for="show-password-checkbox" class="form-input-label-not-bold">${msg("showPassword")}</label>
  </div>
</#macro>
