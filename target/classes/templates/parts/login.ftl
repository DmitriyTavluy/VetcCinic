<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Имя пользователя :</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Имя пользователя"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль :</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Пароль"/>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Почта :</label>
                <div class="col-sm-6">
                    <input type="email" name="email" class="form-control" placeholder="Почта@почта.ру"/>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm><a href="/registration">Регистация</a></#if>
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Зарегестрироваться<#else>Войти</#if></button>
    </form>
</#macro>
<#macro loginnav isAuth>
    <#if !isAuth>
        <form action="/login" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary mr-7" type="submit">Войти</button>
        </form>
    </#if>
</#macro>
<#macro logout isAuth>
    <#if isAuth>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary mr-3" type="submit">Выйти</button>
        </form>
    </#if>
</#macro>
