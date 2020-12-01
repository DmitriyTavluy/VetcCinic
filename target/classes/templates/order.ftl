<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page "none">
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Записатсья на приём
    </a>

    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" action="/order">
                <input type="hidden" name="userId" value="${user.id}">
                <div class="form-group">
                    <span>${user.username}</span>
                </div>
                <div class="form-group">
                    <label> Выберите врача: </label>
                    <select name="employee" class="mdb-select md-form" data-style="btn-info">
                        <#list employees as employee>
                            <option value="${employee.employee_id}">${employee.fio}</option>
                        </#list>
                    </select>
                </div>
                <div class="form-group">
                    <input type="datetime-local" class="form-control" name="time" placeholder=" Дата">
                </div>
                <div class="form-group">
                    <label> Выберите услугу: </label>
                    <select multiple name="services" class="mdb-select md-form" data-style="btn-info">
                        <#list prices as price>
                            <option value="${price.price_id}">${price.procedur}</option>
                        </#list>
                    </select>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <table class="table table-striped table-bordered mt-3">
        <thead>
        <tr>
            <th>Вас принимает</th>
            <th>Время</th>
            <th>Услуги</th>
            <th>Итоговая сумма</th>

        </tr>
        </thead>
        <tbody>
        <#list orders as order>
            <tr>
                <td>${order.employee.fio}</td>
                <td>${order.time}</td>
                <td>
                    <#list order.services as service>
                        <p>${service.procedur}</p>
                    </#list>
                </td>
                <td>
                    ${order.totalCost}
                </td>

                <td>
                    <form action="/order/delete?userId=${user.id}" method="post">
                        <input type="hidden" name="id" value="${order.id}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="submit" class="btn btn-primary" value="Отменить запись">
                    </form>
                </td>

            </tr>
        </#list>
        </tbody>
    </table>



</@c.page>