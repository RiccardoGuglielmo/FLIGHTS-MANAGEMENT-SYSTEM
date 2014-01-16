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
                            String volo_data = session.getAttribute("volo_data").toString();
                            String volo_pc1 = session.getAttribute("volo_pc1").toString();
                            String volo_pc2 = session.getAttribute("volo_pc2").toString();
                            String volo_oraP = session.getAttribute("volo_oraP").toString();
                            String volo_oraA = session.getAttribute("volo_oraA").toString();
                            String volo_ca = session.getAttribute("volo_ca").toString();
                            String volo_prezzo = session.getAttribute("volo_prezzo").toString();
                            String par_nome = session.getAttribute("par_nome").toString();
                            String volo_nazP = session.getAttribute("volo_nazP").toString();
                            String volo_capP = session.getAttribute("volo_capP").toString();
                            String des_nome = session.getAttribute("des_nome").toString();
                            String volo_nazA = session.getAttribute("volo_nazA").toString();
                            String volo_capA = session.getAttribute("volo_capA").toString();
                            String volo_codt = request.getParameter("volo_codt").toString();
                            
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            
                            String query = "INSERT INTO [VOLO] (data, num_pc1, num_pc2, ora_partenza, ora_arrivo, prezzo, nome, par_nome, par_naz, par_cap, des_nome, des_naz, des_cap, codice_t) VALUES ('"+volo_data+"','"+volo_pc1+"','"+volo_pc2+"','"+volo_oraP+"','"+volo_oraA+"','"+volo_prezzo+"','"+volo_ca+"','"+par_nome+"','"+volo_nazP+"','"+volo_capP+"','"+des_nome+"','"+volo_nazA+"','"+volo_capA+"','"+volo_codt+"')";
                            s.executeUpdate(query);
                            
                            %><br>Volo inserito nel database!<br><br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                            
                            s.close();
                            c.close();
                        }
                        catch(ClassNotFoundException e){
                            %><br>Error 1 - <% out.println(e.toString()); %><br><br><br>
                            <a href="gestione.jsp">Torna alla gestione del sistema!</a><%
                        }
                        catch(SQLException e){
                            %><br>Error 2 - <% out.println(e.toString()); %><br><br><br>
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
