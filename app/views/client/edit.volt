<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("client", "Go Back") }}</li>
        </ul>
    </nav>
</div>

<div class="page-header">
    <h1>
        Edit client
    </h1>
</div>

{{ content() }}

{{ form("client/save", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

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


{{ hidden_field("id") }}

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Send', 'class': 'btn btn-default') }}
    </div>
</div>

</form>
