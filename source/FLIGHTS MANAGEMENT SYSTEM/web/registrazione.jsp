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
                <form method="post" action="checkreg.jsp">
                    <table id="rl">
                        <tr>
                            <td class="label">Nome:</td>
                            <td><input type="text" required="required" name="nome" value=""></td>
                        </tr>
                        <tr>
                            <td class="label">Cognome:</td>
                            <td><input type="text" required="required" name="cognome" value=""></td>
                        </tr>
                        <tr>
                            <td class="label">E-mail:</td>
                            <td><input type="text" required="required" name="email" value=""></td>
                        </tr>
                        <tr>
                            <td class="label">Password:</td>
                            <td><input type="password" required="required" name="password" value=""></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input class="but" type="submit" name="submit" value="Invia"></td>
                        </tr>
                    </table>
                </form>
            </article>
            
        </div>
        
    </body>
</html>