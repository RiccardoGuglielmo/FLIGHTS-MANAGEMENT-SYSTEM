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
                
                <div id="box">
                    <p>
                    Benvenuto nel <u><b>FLIGHTS MANAGEMENT SYSTEM</b></u>!<br><br>

                    Gli <b>utenti</b> possono:<br>
                    -	cercare i voli previsti in un certa data;<br>
                    -	prenotare un volo;<br>
                    -	visualizzare tutte le prenotazioni effettuate.<br><br>

                    Gli <b>amministratori</b> del sistema possono:<br>
                    -	registrarsi se non lo si è già fatto;<br>
                    -	effettuare il login;<br>
                    -	inserire nuovi voli;<br>
                    -	inserire nuove località;<br>
                    -	inserire nuove tariffe;<br>
                    -	inserire nuove compagnie aeree.
                    </p>
                </div>
                
            </article>
            
        </div>
        
    </body>
</html>
