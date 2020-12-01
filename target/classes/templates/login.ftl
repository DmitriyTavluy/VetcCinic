<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page "none">
    ${employee?ifExists }
<@l.login "/login" false/>
</@c.page>
