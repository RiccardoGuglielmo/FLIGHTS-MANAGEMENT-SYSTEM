<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FLIGHTS MANAGEMENT SYSTEM</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        
        <div id="container">
            
            <header>
                <%@ include file="header.jspf" %>
            </header>

            <nav>
                <%@ include file="nav.jspf" %>
            </nav>

            <article>
                <form method="post" action="checklog.jsp">
                    <table class="rl">
                        <tr>
                            <td class="label">Email address:</td>
                            <td><input type="text" required="required" name="usr" value=""></td>
                        </tr>
                        <tr>
                            <td class="label">Password:</td>
                            <td><input type="password" required="required" name="psw" value=""></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input class="but" type="submit" name="submit" value="Login"></td>
                        </tr>
                    </table>
                </form>
            </article>
            
        </div>
        
    </body>
</html>