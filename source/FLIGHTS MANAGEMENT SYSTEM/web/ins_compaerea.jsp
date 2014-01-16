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
                            String ca_nome = (String)request.getParameter("ca_nome");
                            String ca_email = (String)request.getParameter("ca_email");
                            String ca_telefono = (String)request.getParameter("ca_telefono");
                            
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            
                            String query = "INSERT INTO [COMPAGNIA_AEREA] VALUES ('"+ca_nome+"','"+ca_email+"','"+ca_telefono+"')";
                            s.executeUpdate(query);
                            
                            %> La compagnia aerea denominata: <% out.print(ca_nome); %>, 
                            con indirizzo email: <% out.print(ca_email); %>
                            e numero di telefono: <% out.print(ca_telefono); %>, è stata inserita nel database!<br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                            
                            s.close();
                            c.close();
                        }
                        catch(ClassNotFoundException e){
                            %><br>Error 1 - <% out.println(e.toString()); %><br><br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                        }
                        catch(SQLException e){
                            %><br>Error 2 - <% out.println(e.toString()); %><br><br><br> Compagnia Aerea già inserita!<br><br><br><br>
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
