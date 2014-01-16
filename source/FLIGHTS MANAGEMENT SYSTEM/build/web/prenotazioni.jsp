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
                
                <form class="center" method="post" action="findprenotazioni.jsp">
                    <br>Visualizza le tue prenotazioni!<br><br><br>                
                    <table class="rl">
                        <tr>
                            <td class="label">Codice fiscale:</td>
                            <td><input type="text" required="required" name="codice_fiscale"></td>
                        </tr>
                    </table>
                    <br><br> <input class="but" type="submit" name="submit" value="Visualizza">
                </form>
                
            </article>
            
        </div>
        
    </body>
</html>
