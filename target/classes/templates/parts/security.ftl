<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    id = user.getId()
    isAdmin = user.isAdmin()
    isAuth = true
    >
<#else>
    <#assign
    isAuth = false
    name = "Гость"
    isAdmin = false
    >
</#if>
