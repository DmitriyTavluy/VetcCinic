<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page "none">
<div class="mb-7">Регистрация</div>
${employee?ifExists }
<@l.login "/registration" true />
</@c.page>
