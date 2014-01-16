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
                            String usr = (String)request.getParameter("usr");
                            String psw = (String)request.getParameter("psw");
                            
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            ResultSet rs = s.executeQuery("SELECT * FROM AMMINISTRATORE WHERE email='"+ usr +"'");
                            
                            String cognome = "", nome = "", email = "", pass = "";
                            
                            while (rs.next()){
                                cognome = rs.getString("cognome");
                                nome = rs.getString("nome");
                                email = rs.getString("email");
                                pass = rs.getString("password");
                            }
                            
                            if( psw.equals(pass) )
                            {
                                %> L'utente <% out.print(nome); %> 
                                <% out.print(cognome); %>, con l'indirizzo 
                                e-mail: <% out.print(email); %>, 
                                ha effettuato la login.<br><br>
                                <a href="gestione.jsp">Clicca qui per la gestione del sistema!</a><%
                            }
                            else
                            {
                                %> Dati inseriti errati! <%
                            }
                            
                            rs.close();
                            s.close();
                            c.close();
                        }
                        catch(ClassNotFoundException e){
                            %><br>Error 1 - <% out.println(e.toString()); %><br><br><%
                        }
                        catch(SQLException e){
                            %><br>Error 2 - <% out.println(e.toString()); %><br><br><%
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
