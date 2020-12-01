<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">


<@c.page "none">
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
                       placeholder="Поиск по должности">
                <button type="submit" class="btn btn-primary ml-2">Поиск</button>
            </form>
        </div>
    </div>
    <#if isAdmin>
        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            Добавить сотрудника
        </a>

        <div class="collapse" id="collapseExample">
            <div class="form-group mt-3">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" name="fio" placeholder=" ФИО сотрудника"/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="position" placeholder=" Должность">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="education" placeholder=" Образование">
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="file" id="customFile">
                            <label class="custom-file-label" for="customFile">Choose file</label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
            </div>
        </div>
    </#if>
    <div class="card-columns">
        <#list employees as employee>
            <div class="card my-3">
                <#if employee.filename??>
                    <img src="/img/${employee.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${employee.fio}</span>
                    <br>
                    <i>Должность: ${employee.position}</i>

                    <p>Образовани: ${employee.education}</p>
                </div>
            <#if isAdmin>
                <div class="card-footer text-muted">
                    ${employee.education}
                    <form action="/employee/delete" method="post">
                        <input type="hidden" name="id" value="${employee.employee_id}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="submit" class="btn btn-primary" value="Удалить">
                    </form>
                </div>
            </#if>
            </div>
        <#else>
            No employee
        </#list>
    </div>
</@c.page>
