<#import "parts/common.ftl" as c>

<@c.page "none">
    Список пользователей


    <table class="table table-striped table-bordered">
        <thead class="thead-inverse">
        <tr>
            <th>Иия пользователя</th>
            <th>Роль</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>

                <td>${user.username}</td>

                <td><#list user.roles as role>${role}<#sep>, </#list></td>

                <td><a href="/user/${user.id}">Изменить</a></td>
                <td>
                    <form action="/user/delete" method="post">
                        <input type="hidden" name="id" value="${user.id}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="submit" class="btn btn-primary" value="Удалить">
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>
