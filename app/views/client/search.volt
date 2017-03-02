<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("client/index", "Go Back") }}</li>
            <li class="next">{{ link_to("client/new", "Create ") }}</li>
        </ul>
    </nav>
</div>

<div class="page-header">
    <h1>Search result</h1>
</div>

{{ content() }}

<div class="row">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Id</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Birthday</th>
            <th>Juridiction</th>
            <th>Phone</th>
            <th>ContractStatus</th>

                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        {% if page.items is defined %}
        {% for client in page.items %}
            <tr>
                <td>{{ client.id }}</td>
            <td>{{ client.name }}</td>
            <td>{{ client.surname }}</td>
            <td>{{ client.email }}</td>
            <td>{{ client.gender }}</td>
            <td>{{ client.birthday }}</td>
            <td>{{ client.juridiction }}</td>
            <td>{{ client.phone }}</td>
            <td>{{ client.contractStatus }}</td>

                <td>{{ link_to("client/edit/"~client.id, "Edit") }}</td>
                <td>{{ link_to("client/delete/"~client.id, "Delete") }}</td>
            </tr>
        {% endfor %}
        {% endif %}
        </tbody>
    </table>
</div>

<div class="row">
    <div class="col-sm-1">
        <p class="pagination" style="line-height: 1.42857;padding: 6px 12px;">
            {{ page.current~"/"~page.total_pages }}
        </p>
    </div>
    <div class="col-sm-11">
        <nav>
            <ul class="pagination">
                <li>{{ link_to("client/search", "First") }}</li>
                <li>{{ link_to("client/search?page="~page.before, "Previous") }}</li>
                <li>{{ link_to("client/search?page="~page.next, "Next") }}</li>
                <li>{{ link_to("client/search?page="~page.last, "Last") }}</li>
            </ul>
        </nav>
    </div>
</div>
