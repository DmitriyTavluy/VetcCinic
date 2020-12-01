<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Animal's Best Friends</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Главная страница</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Наши сотрудники</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/price">Прайс лист</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">Список пользователей</a>
                </li>

            </#if>
            <#if isAuth>
                <li class="nav-item">
                    <a class="nav-link" href="/order?userId=${id}">Запись</a>
                </li>
            </#if>
            <li class="nav-item">
                <a class="nav-link" href="/about">О нас</a>
            </li>
        </ul>

        <div class="navbar-text mr-3">${name}</div>

        <@l.loginnav isAuth/>

        <@l.logout isAuth/>
    </div>
</nav>
