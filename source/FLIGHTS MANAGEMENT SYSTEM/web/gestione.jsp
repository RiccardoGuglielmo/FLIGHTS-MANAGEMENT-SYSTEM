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
                <%@ include file="navbar.jspf" %>
            </nav>

            <article>
                    
                    <table>
                        <tr>
                            <td>
                                <form class="f" method="post" action="ins_volo.jsp">
                                    <table class="tabtime">
                                        <tr><td>Partenza da: </td></tr>
                                        <tr><td><input type="text" required="required" name="par_nome" placeholder="città"/></td></tr>
                                        <tr><td><input type="text" required="required" name="volo_nazP" placeholder="nazionalità"/></td></tr>
                                        <tr><td><input type="text" required="required" name="volo_capP" placeholder="CAP"/></td></tr>
                                    </table>
                                    <table class="tabtime">
                                        <tr>
                                            <td>alle: </td>
                                            <td><input type="time" required="required" name="volo_oraP"/></td>
                                        </tr>
                                    </table>
                                    <table class="tabtime">
                                        <tr><td>Arrivo a: </td></tr>
                                        <tr><td><input type="text" required="required" name="des_nome" placeholder="città"/></td></tr>
                                        <tr><td><input type="text" required="required" name="volo_nazA" placeholder="nazionalità"/></td></tr>
                                        <tr><td><input type="text" required="required" name="volo_capA" placeholder="CAP"/></td></tr>
                                    </table>
                                    <table class="tabtime">
                                        <tr>
                                            <td>alle: </td>
                                            <td><input type="time" required="required" name="volo_oraA"/></td>
                                        </tr>
                                    </table>
                                    <input class="calendar" type="date" required="required" name="volo_data"/><br>
                                    <input type="text" required="required" name="volo_ca" placeholder="Compagnia aerea:"><br>
                                    <input type="text" required="required" name="volo_pc1" placeholder="# posti classe 1:"><br>
                                    <input type="text" required="required" name="volo_pc2" placeholder="# posti classe 2:"><br>
                                    <input type="text" required="required" name="volo_prezzo" placeholder="Prezzo (€):"><br><br>
                                    <input class="button" type="submit" name="submit" value="Inserisci Volo">
                                </form>
                            </td>
                            <td>
                                <form class="f" method="post" action="ins_tariffa.jsp">
                                    <input type="text" required="required" name="tar_classe1" placeholder="Costo classe 1:"><br>
                                    <input type="text" required="required" name="tar_classe2" placeholder="Costo classe 2:"><br>
                                    <input type="text" required="required" name="tar_scontom" placeholder="Sconto minori:"><br>
                                    <input type="text" required="required" name="tar_costob" placeholder="Costo bagaglio:"><br><br>
                                    <input class="button" type="submit" name="submit" value="Inserisci Tariffa">
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form class="f" method="post" action="ins_compaerea.jsp">
                                    <input type="text" required="required" name="ca_nome" placeholder="Nome:"><br>
                                    <input type="text" required="required" name="ca_email" placeholder="E-mail address:"><br>
                                    <input type="text" required="required" name="ca_telefono" placeholder="Telefono:"><br><br>
                                    <input class="button" type="submit" name="submit" value="Inserisci C.A.">
                                </form>
                            </td>
                            <td>
                                <form class="f" method="post" action="ins_località.jsp">
                                    <input type="text" required="required" name="loc_nome" placeholder="Nome:"><br>
                                    <input type="text" required="required" name="loc_naz" placeholder="Nazionalità:"><br>
                                    <input type="text" required="required" name="loc_cap" placeholder="CAP:"><br><br>
                                    <input class="button" type="submit" name="submit" value="Inserisci Località">
                                </form>
                            </td>
                        </tr>
                    </table>
                
            </article>
            
        </div>
        
    </body>
</html>
