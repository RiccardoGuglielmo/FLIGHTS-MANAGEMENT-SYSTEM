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
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            String query = "SELECT codice_fiscale FROM PASSEGGERO WHERE codice_fiscale = '"+request.getParameter("codice_fiscale")+"'";
                            ResultSet rs = s.executeQuery(query);
                            
                            if( rs.next() )
                            {
                                query = "SELECT VOLO.num_v AS numv, ora_partenza, par_nome, par_naz, par_cap, ora_arrivo, des_nome, des_naz, des_cap, data, VOLO.nome AS nomeca, classe, num_passeggeri, num_minori, num_bagagli "+
                                        "FROM VOLO, PRENOTAZIONE, BIGLIETTO, PASSEGGERO WHERE "+
                                        "PASSEGGERO.codice_fiscale = '"+request.getParameter("codice_fiscale")+"' AND PASSEGGERO.codice_fiscale = BIGLIETTO.codice_fiscale AND BIGLIETTO.num_p = PRENOTAZIONE.num_p AND PRENOTAZIONE.num_v = VOLO.num_v";
                                rs = s.executeQuery(query);

                                DateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                                %><h1>PRENOTAZIONI EFFETTUATE:</h1>
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
                                   </tr>
                                  <%while (rs.next()){
                                  %><tr>
                                        <td><%out.println(rs.getString("numv"));%></td>
                                        <td><%out.println(rs.getString("ora_partenza"));%></td>
                                        <td><%out.println(rs.getString("par_nome"));%></td>
                                        <td><%out.println(rs.getString("par_naz"));%></td>
                                        <td><%out.println(rs.getString("par_cap"));%></td>
                                        <td><%out.println(rs.getString("ora_arrivo"));%></td>
                                        <td><%out.println(rs.getString("des_nome"));%></td>
                                        <td><%out.println(rs.getString("des_naz"));%></td>
                                        <td><%out.println(rs.getString("des_cap"));%></td>
                                        <td><%out.println(f.format(rs.getDate("data")));%></td>
                                        <td><%out.println(rs.getString("nomeca"));%></td>
                                        <td><%out.println(rs.getString("classe"));%></td>
                                        <td><%out.println(rs.getString("num_passeggeri"));%></td>
                                        <td><%out.println(rs.getString("num_minori"));%></td>
                                        <td><%out.println(rs.getString("num_bagagli"));%></td>
                                   </tr><%
                                  }
                                %></table><br><br><br><%
                            }
                            else {
                                %><br><br><br>L'utente con codice fiscale: <%out.print(request.getParameter("codice_fiscale"));%>, non ha effettuato alcuna prenotazione! <br><br><br>
                                <a href="prenotazioni.jsp">Torna alla ricerca delle prenotazioni!</a><br><br><br><%
                            }
                            
                            rs.close();
                            s.close();
                            c.close();
                        }
                        catch(ClassNotFoundException e){
                            %><br>Error 1 - <% out.println(e.toString()); %><br><br><br>
                            <a href="prenotazioni.jsp">Torna alla ricerca delle prenotazioni!</a><%
                        }
                        catch(SQLException e){
                            %><br>Error 2 - <% out.println(e.toString()); %><br><br><br>
                            <a href="prenotazioni.jsp">Torna alla ricerca delle prenotazioni!</a><%
                        }
                        catch(Exception e){
                            %><br>Error 3 - <% out.println(e.toString()); %><br><br><br>
                            <a href="prenotazioni.jsp">Torna alla ricerca delle prenotazioni!</a><%
                        }
                    %>
                    
                </div>
                
            </article>
            
        </div>
        
    </body>
</html>
