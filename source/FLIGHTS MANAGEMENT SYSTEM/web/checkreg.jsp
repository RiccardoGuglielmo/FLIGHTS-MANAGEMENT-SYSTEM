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
                            String nome = (String)request.getParameter("nome");
                            String cognome = (String)request.getParameter("cognome");
                            String email = (String)request.getParameter("email");
                            String psw = (String)request.getParameter("password");
                            
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            
                            String query = "INSERT INTO [AMMINISTRATORE] VALUES ('"+nome+"','"+cognome+"','"+email+"','"+psw+"')";
                            s.executeUpdate(query);
                            
                            %> Utente <% out.print(nome); %>
                            <% out.print(cognome); %>
                            registrato con successo.<br><br>
                            Adesso è possibile effettuare il <a href="login.jsp">login</a>!<%
                            
                            s.close();
                            c.close();
                        }
                        catch(ClassNotFoundException e){
                            %><br>Error 1 - <% out.println(e.toString()); %><br><br><%
                        }
                        catch(SQLException e){
                            %><br>Error 2 - <% out.println(e.toString()); %><br><br><br>
                            Indirizzo email già registrato!<br><br><%
                        }
                        catch(Exception e){
                            %><br>Error 3 - <% out.println(e.toString()); %><br><br><%
                        }
                    %>
                    
                </div>
                
            </article>
            
        </div>
        
    </body>
</html>