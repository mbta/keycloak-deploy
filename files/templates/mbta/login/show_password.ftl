<#macro input_group onchange>

	<div class="form-group-small" id="show-password-container" style="display: none">
    <div class="checkbox-input-group" id="show-password-group">
      <input id="show-password-checkbox" class="form-input-checkbox" type="checkbox" onchange="${onchange}"/>
      <label for="show-password-checkbox" class="form-input-label-not-bold">${msg("showPassword")}</label>
    </div>

    <script type="text/javascript">
      document.getElementById('show-password-container').style.display = "flex"
    </script>
	</div>
</#macro>
