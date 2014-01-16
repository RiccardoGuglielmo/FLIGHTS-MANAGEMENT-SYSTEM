<%@ page language="java" import="java.text.DateFormat" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%@ page language="java" import="java.sql.*" %> 
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
                
                <div class="center">
                    
                    <%                        
                        try{
                            String data = (String)request.getParameter("calendar");
                            
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            String query = "SELECT num_v, ora_partenza, par_nome, par_naz, par_cap, ora_arrivo, des_nome, des_naz, des_cap, VOLO.nome, prezzo, classe1, classe2, sconto_minori, costo_bagaglio "+
                                           "FROM VOLO, TARIFFA WHERE "+
                                           "data = #"+data+"# AND VOLO.codice_t = TARIFFA.codice_t ORDER BY num_v";
                            ResultSet rs = s.executeQuery(query);
                            
                    %><h1>VOLI DEL <%out.println(data.substring(8,10) + "/" + data.substring(5,7) + "/" + data.substring(0,4));%></h1>
                            <table class="voli">
                                <tr>
                                    <td>N°</td>
                                    <td>PARTE ALLE</td>
                                    <td>DA</td>
                                    <td>NAZ</td>
                                    <td>CAP</td>
                                    <td>ARRIVA ALLE</td>
                                    <td>A</td>
                                    <td>NAZ</td>
                                    <td>CAP</td>
                                    <td>OFFERTO DA</td>
                                    <td>PREZZO</td>
                                    <td>CLASSE 1</td>
                                    <td>CLASSE 2</td>
                                    <td>SCONTO MINORI</td>
                                    <td>COSTO BAGAGLIO</td>
                                </tr><%
                                while (rs.next()){
                                %><tr>
                                    <td><%out.println(rs.getString("num_v"));%></td>
                                    <td><%out.println(rs.getString("ora_partenza"));%></td>
                                    <td><%out.println(rs.getString("par_nome"));%></td>
                                    <td><%out.println(rs.getString("par_naz"));%></td>
                                    <td><%out.println(rs.getString("par_cap"));%></td>
                                    <td><%out.println(rs.getString("ora_arrivo"));%></td>
                                    <td><%out.println(rs.getString("des_nome"));%></td>
                                    <td><%out.println(rs.getString("des_naz"));%></td>
                                    <td><%out.println(rs.getString("des_cap"));%></td>
                                    <td><%out.println(rs.getString("nome"));%></td>
                                    <td><%out.println(rs.getString("prezzo"));%>€</td>
                                    <td>+<%out.println(rs.getString("classe1"));%>%</td>
                                    <td>+<%out.println(rs.getString("classe2"));%>%</td>
                                    <td>-<%out.println(rs.getString("sconto_minori"));%>%</td>
                                    <td><%out.println(rs.getString("costo_bagaglio"));%>€</td>
                                </tr><%
                                }
                            %></table><br><br><br>
                            
                            <form class="center" method="post" action="prenotazione.jsp">
                                <br>Vuoi prenotare un volo? Inserisci i seguenti dati:<br><br><br>                
                                <table class="prenota">
                                    <tr>
                                        <td class="label">N° volo:</td>
                                        <td><input type="text" required="required" name="num_v"/></td>
                                    </tr>
                                    <tr>
                                        <td class="label">Classe:</td>
                                        <td><input type="text" required="required" name="classe"></td>
                                    </tr>
                                    <tr>
                                        <td class="label">Numero di passeggeri:</td>
                                        <td><input type="text" required="required" name="num_passeggeri"></td>
                                    </tr>
                                    <tr>
                                        <td class="label">Numero di minori:</td>
                                        <td><input type="text" required="required" name="num_minori"></td>
                                    </tr>
                                    <tr>
                                        <td class="label">Numero di bagagli:</td>
                                        <td><input type="text" required="required" name="num_bagagli"></td>
                                    </tr>
                                </table>
                                <br><br> <input class="but" type="submit" name="submit" value=" NEXT > ">
                            </form><br><br>
                            
                            <%
                            rs.close();
                            s.close();
                            c.close();
                        }
                        catch(ClassNotFoundException e){
                            %><br>Error 1 - <% out.println(e.toString()); %><br><br><br>
                            <a href="voli.jsp">Torna alla ricerca voli!</a><%
                        }
                        catch(SQLException e){
                            %><br>Error 2 - <% out.println(e.toString()); %><br><br><br>
                            <a href="voli.jsp">Torna alla ricerca voli!</a><%
                        }
                        catch(Exception e){
                            %><br>Error 3 - <% out.println(e.toString()); %><br><br><br>
                            <a href="voli.jsp">Torna alla ricerca voli!</a><%
                        }
                    %>
                    
                </div>
                
            </article>
            
        </div>
        
    </body>
</html>
