<div class="page-header">
    <h1>
        Search client
    </h1>
    <p>
        {{ link_to("client/new", "Create client") }}
    </p>
</div>

{{ content() }}

{{ form("client/search", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

<div class="form-group">
    <label for="fieldId" class="col-sm-2 control-label">Id</label>
    <div class="col-sm-10">
        {{ text_field("id", "type" : "numeric", "class" : "form-control", "id" : "fieldId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldName" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
        {{ text_field("name", "size" : 30, "class" : "form-control", "id" : "fieldName") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldSurname" class="col-sm-2 control-label">Surname</label>
    <div class="col-sm-10">
        {{ text_field("surname", "size" : 30, "class" : "form-control", "id" : "fieldSurname") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldEmail" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
        {{ text_field("email", "size" : 30, "class" : "form-control", "id" : "fieldEmail") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldGender" class="col-sm-2 control-label">Gender</label>
    <div class="col-sm-10">
        {{ text_field("gender", "size" : 30, "class" : "form-control", "id" : "fieldGender") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldBirthday" class="col-sm-2 control-label">Birthday</label>
    <div class="col-sm-10">
        {{ text_field("birthday", "size" : 30, "class" : "form-control", "id" : "fieldBirthday") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldJuridiction" class="col-sm-2 control-label">Juridiction</label>
    <div class="col-sm-10">
        {{ text_field("juridiction", "size" : 30, "class" : "form-control", "id" : "fieldJuridiction") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldPhone" class="col-sm-2 control-label">Phone</label>
    <div class="col-sm-10">
        {{ text_field("phone", "size" : 30, "class" : "form-control", "id" : "fieldPhone") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldContractstatus" class="col-sm-2 control-label">ContractStatus</label>
    <div class="col-sm-10">
        {{ text_field("contractStatus", "size" : 30, "class" : "form-control", "id" : "fieldContractstatus") }}
    </div>
</div>


<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Search', 'class': 'btn btn-default') }}
    </div>
</div>

</form>
