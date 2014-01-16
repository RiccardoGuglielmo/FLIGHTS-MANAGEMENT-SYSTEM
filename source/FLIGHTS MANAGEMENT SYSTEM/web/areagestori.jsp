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
                <table>
                    <tr>
                        <td><a href="registrazione.jsp">REGISTRAZIONE</a></td>
                        <td><a href="login.jsp">LOGIN</a></td>
                    </tr>
                </table>
            </article>
            
        </div>
        
    </body>
</html>
