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
                            String num_v = (String)request.getParameter("num_v");
                            
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            String query = "SELECT num_v, ora_partenza, par_nome, par_naz, par_cap, ora_arrivo, des_nome, des_naz, des_cap, data, VOLO.nome, prezzo, classe1, classe2, sconto_minori, costo_bagaglio "+
                                           "FROM VOLO, TARIFFA WHERE "+
                                           "num_v = "+ num_v +" AND VOLO.codice_t = TARIFFA.codice_t";
                            ResultSet rs = s.executeQuery(query);
                            rs.next();
                            
                            DateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                            int tempc;
                            float prezzo, tot = 0;
                            %><h1>RIEPILOGO:</h1>
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
                                    <td>DATA</td>
                                    <td>OFFERTO DA</td>
                                    <td>CLASSE</td>
                                    <td>N° PASSEGGERI:</td>
                                    <td>N° MINORI:</td>
                                    <td>N° BAGAGLI</td>
                                    <td>TOT</td>
                                </tr>
                                <tr>
                                    <td><%out.println(rs.getString("num_v"));%></td>
                                    <td><%out.println(rs.getString("ora_partenza"));%></td>
                                    <td><%out.println(rs.getString("par_nome"));%></td>
                                    <td><%out.println(rs.getString("par_naz"));%></td>
                                    <td><%out.println(rs.getString("par_cap"));%></td>
                                    <td><%out.println(rs.getString("ora_arrivo"));%></td>
                                    <td><%out.println(rs.getString("des_nome"));%></td>
                                    <td><%out.println(rs.getString("des_naz"));%></td>
                                    <td><%out.println(rs.getString("des_cap"));%></td>
                                    <td><%out.println(f.format(rs.getDate("data")));%></td>
                                    <td><%out.println(rs.getString("nome"));%></td>
                                    <td><%out.println(request.getParameter("classe"));%></td>
                                    <td><%out.println(request.getParameter("num_passeggeri"));%></td>
                                    <td><%out.println(request.getParameter("num_minori"));%></td>
                                    <td><%out.println(request.getParameter("num_bagagli"));%></td>
                                    <% prezzo = rs.getFloat("prezzo");
                                       if ( request.getParameter("classe").equals("1") )
                                       {
                                           tempc = rs.getInt("classe1");
                                           tot = ( prezzo / 100 * tempc + prezzo ) * ( Integer.valueOf(request.getParameter("num_passeggeri")).intValue() - Integer.valueOf(request.getParameter("num_minori")).intValue() ) ;
                                           tot = tot + ( ( prezzo / 100 * tempc + prezzo ) / 100 * ( 100 - Integer.valueOf(rs.getInt("sconto_minori")).intValue() ) ) * Integer.valueOf(request.getParameter("num_minori")).intValue() ;
                                           tot = tot + rs.getFloat("costo_bagaglio") * Float.valueOf(request.getParameter("num_bagagli")).floatValue();
                                       }
                                       else if ( request.getParameter("classe").equals("2") )
                                       {
                                           tempc = rs.getInt("classe2");
                                           tot = ( prezzo / 100 * tempc + prezzo ) * ( Integer.valueOf(request.getParameter("num_passeggeri")).intValue() - Integer.valueOf(request.getParameter("num_minori")).intValue() ) ;
                                           tot = tot + ( ( prezzo / 100 * tempc + prezzo ) / 100 * ( 100 - Integer.valueOf(rs.getInt("sconto_minori")).intValue() ) * Integer.valueOf(request.getParameter("num_minori")).intValue() ) ;
                                           tot = tot + rs.getFloat("costo_bagaglio") * Float.valueOf(request.getParameter("num_bagagli")).floatValue();
                                       }
                                    %>
                                    <td><%out.println( tot );%>€</td>
                                </tr>
                            </table><br><br><br>
                            
                            <%
                                session.setAttribute("num_v", request.getParameter("num_v"));
                                session.setAttribute("classe", request.getParameter("classe"));
                                session.setAttribute("num_passeggeri", request.getParameter("num_passeggeri"));
                                session.setAttribute("num_minori", request.getParameter("num_minori"));
                                session.setAttribute("num_bagagli", request.getParameter("num_bagagli"));
                                session.setAttribute("costo_p", tot);
                            %>
                            
                            <form class="center" method="post" action="prenota.jsp">
                                <br><h1>Per concludere la prenotazione<br>inserire i seguenti dati:</h1>
                            <% for ( int i=1; i <= Integer.valueOf(request.getParameter("num_passeggeri")).intValue(); i++ ) {
                                    out.print("<br><br>Passeggero "+i+":<br><br>"
                                    + "<table class=\"prenota\">"
                                    + "<tr><td class=\"label\">Nome:</td><td><input type=\"text\" required=\"required\" name=\"nome"+i+"\"></td></tr>"
                                    + "<tr><td class=\"label\">Cognome:</td><td><input type=\"text\" required=\"required\" name=\"cognome"+i+"\"></td></tr>"
                                    + "<tr><td class=\"label\">Codice fiscale:</td><td><input type=\"text\" required=\"required\" name=\"codice_fiscale"+i+"\"></td></tr>"
                                    + "<tr><td class=\"label\">ID card:</td><td><input type=\"text\" required=\"required\" name=\"id_card"+i+"\"></td></tr>"
                                    + "<tr><td class=\"label\">Data di nascita:</td><td><input type=\"date\" required=\"required\" name=\"data_nascita"+i+"\"></td></tr>"
                                    + "</table><br><br>");
                               }
                            %> <br><br><input class="but" type="submit" name="submit" value=" PRENOTA ">
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
