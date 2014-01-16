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
                <%@ include file="navbar.jspf" %>
            </nav>

            <article>
                
                <div class="center">
                    
                    <%
                        try{
                            String tar_classe1 = (String)request.getParameter("tar_classe1");
                            String tar_classe2 = (String)request.getParameter("tar_classe2");
                            String tar_scontom = (String)request.getParameter("tar_scontom");
                            String tar_costob = (String)request.getParameter("tar_costob");
                            
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            
                            String query = "INSERT INTO [TARIFFA] (classe1, classe2, sconto_minori, costo_bagaglio) VALUES ('"+tar_classe1+"','"+tar_classe2+"','"+tar_scontom+"','"+tar_costob+"')";
                            s.executeUpdate(query);
                            
                            %> Tariffa inserita nel database!<br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                            
                            s.close();
                            c.close();
                        }
                        catch(ClassNotFoundException e){
                            %><br>Error 1 - <% out.println(e.toString()); %><br><br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                        }
                        catch(SQLException e){
                            %><br>Error 2 - <% out.println(e.toString()); %><br><br><br> Tariffa già inserita!<br><br><br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                        }
                        catch(Exception e){
                            %><br>Error 3 - <% out.println(e.toString()); %><br><br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                        }
                    %>
                    
                </div>
                
            </article>
            
        </div>
        
    </body>
</html>
