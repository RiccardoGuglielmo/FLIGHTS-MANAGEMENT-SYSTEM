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
                            String query;
                            ResultSet rs;
                            
                            for ( int i=1; i <= Integer.valueOf(session.getAttribute("num_passeggeri").toString()).intValue(); i++ ) {
                                query = "SELECT codice_fiscale FROM PASSEGGERO WHERE codice_fiscale = '"+request.getParameter("codice_fiscale"+i)+"'";
                                rs = s.executeQuery(query);
                                if( !rs.next() )
                                {
                                    query = "INSERT INTO [PASSEGGERO] VALUES ('"+request.getParameter("cognome"+i)+"','"+request.getParameter("nome"+i)+"','"+request.getParameter("codice_fiscale"+i)+"','"+request.getParameter("data_nascita"+i)+"','"+request.getParameter("id_card"+i)+"')";
                                    s.executeUpdate(query);
                                }
                            }
                            
                            query = "INSERT INTO [PRENOTAZIONE] (classe, num_passeggeri, num_minori, num_bagagli, costo_p, num_v) VALUES ("+session.getAttribute("classe")+","+session.getAttribute("num_passeggeri")+","+session.getAttribute("num_minori")+","+session.getAttribute("num_bagagli")+","+session.getAttribute("costo_p")+","+session.getAttribute("num_v")+")";
                            s.executeUpdate(query);
                            query = "SELECT LAST(num_p) AS nump FROM PRENOTAZIONE";
                            rs = s.executeQuery(query);
                            rs.next();
                            int num_p = rs.getInt("nump");
                            
                            %><h1>Prenotazione effettuata con succeso!</h1><br><br>
                                <table class="voli">
                                    <tr>
                                        <td>N° BIGLIETTO</td>
                                        <td>COGNOME</td>
                                        <td>NOME</td>
                                    </tr><%
                            for ( int i=1; i <= Integer.valueOf(session.getAttribute("num_passeggeri").toString()).intValue(); i++ ) {
                                query = "INSERT INTO [BIGLIETTO] (codice_fiscale, num_p) VALUES ('"+request.getParameter("codice_fiscale"+i)+"',"+num_p+")";
                                s.executeUpdate(query);
                                query = "SELECT LAST(num_b) AS numb FROM BIGLIETTO";
                                rs = s.executeQuery(query);
                                rs.next();%>
                                    <tr>
                                        <td><%out.println(rs.getString("numb"));%></td>
                                        <td><%out.println(request.getParameter("cognome"+i));%></td>
                                        <td><%out.println(request.getParameter("nome"+i));%></td>
                                    </tr><%
                            }
                            %></table><br><br><br>
                            
                            <%
                            rs.close();
                            s.close();
                            c.close();
                            
                            %><br><br><br><a href="index.jsp">Torna alla homepage!</a><br><br><br><%
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
