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
                            String loc_nome = (String)request.getParameter("loc_nome");
                            String loc_naz = (String)request.getParameter("loc_naz");
                            String loc_cap = (String)request.getParameter("loc_cap");
                            
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            
                            String query = "INSERT INTO [LOCALITA] VALUES ('"+loc_nome+"','"+loc_naz+"','"+loc_cap+"')";
                            s.executeUpdate(query);
                            
                            %> La località denominata "<% out.print(loc_nome); %>" di nazionalità <% out.print(loc_naz); %>
                            con CAP: <% out.print(loc_cap); %>, è stata inserita nel database!<br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                            
                            s.close();
                            c.close();
                        }
                        catch(ClassNotFoundException e){
                            %><br>Error 1 - <% out.println(e.toString()); %><br><br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                        }
                        catch(SQLException e){
                            %><br>Error 2 - <% out.println(e.toString()); %><br><br><br> Località già inserita!<br><br><br><br>
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
