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
                
                <form class="center" method="post" action="findvoli.jsp">
                    Cerca voli in data:
                    <input type="date" required="required" name="calendar"/>
                    <input class="but" type="submit" name="submit" value="Cerca"/>
                </form>
                
            </article>
            
        </div>
        
    </body>
</html>
