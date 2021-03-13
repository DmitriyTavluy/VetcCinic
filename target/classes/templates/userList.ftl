<#import "parts/common.ftl" as c>

<@c.page "none">
    Список пользователей


    <table class="table table-striped table-bordered">
        <thead class="thead-inverse">
        <tr>
            <th>Имя пользователя</th>
            <th>Роль</th>
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
                        <input type="submit" class="btn btn-link" value="Удалить">
                    </form>
                </td>
                <td>
                    <form method="post" action="/user/blockUser">
                        <input type="hidden" value="${user.id}" name="id">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit" class="btn btn-link">Заблокировать</button>
                    </form>
                </td>
                <td>
                    <form method="post" action="/user/unblockUser">
                        <input type="hidden" value="${user.id}" name="id">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit" class="btn btn-link">Разблокировать</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>
