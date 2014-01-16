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
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            String dburl = "jdbc:odbc:FMS";
                            
                            Connection c = DriverManager.getConnection(dburl,"","");
                            Statement s = c.createStatement();
                            String query = "SELECT * FROM TARIFFA";
                            ResultSet rs = s.executeQuery(query);
                            
                            %><h1>TARIFFE:</h1>
                            <table class="voli">
                                <tr>
                                    <td>CODICE</td>
                                    <td>CLASSE 1</td>
                                    <td>CLASSE 2</td>
                                    <td>SCONTO MINORI</td>
                                    <td>COSTO BAGAGLIO</td>
                               </tr>
                              <%while (rs.next()){
                              %><tr>
                                    <td><%out.println(rs.getString("codice_t"));%></td>
                                    <td>+<%out.println(rs.getString("classe1"));%>%</td>
                                    <td>+<%out.println(rs.getString("classe2"));%>%</td>
                                    <td>-<%out.println(rs.getString("sconto_minori"));%>%</td>
                                    <td><%out.println(rs.getString("costo_bagaglio"));%>€</td>
                               </tr><%
                              }
                            %></table><br><br><br>
                            
                            <%
                            session.setAttribute("volo_data", request.getParameter("volo_data"));
                            session.setAttribute("volo_pc1", request.getParameter("volo_pc1"));
                            session.setAttribute("volo_pc2", request.getParameter("volo_pc2"));
                            session.setAttribute("volo_oraP", request.getParameter("volo_oraP"));
                            session.setAttribute("volo_oraA", request.getParameter("volo_oraA"));
                            session.setAttribute("volo_ca", request.getParameter("volo_ca"));
                            session.setAttribute("volo_prezzo", request.getParameter("volo_prezzo"));
                            session.setAttribute("par_nome", request.getParameter("par_nome"));
                            session.setAttribute("volo_nazP", request.getParameter("volo_nazP"));
                            session.setAttribute("volo_capP", request.getParameter("volo_capP"));
                            session.setAttribute("des_nome", request.getParameter("des_nome"));
                            session.setAttribute("volo_nazA", request.getParameter("volo_nazA"));
                            session.setAttribute("volo_capA", request.getParameter("volo_capA"));
                            %>
                            
                            <form class="center" method="post" action="ins_tar_volo.jsp">
                                <br>Inserisci il codice della tariffa da associare al nuovo volo:<br><br>
                                <table class="prenota">
                                    <tr>
                                        <td><input type="text" required="required" name="volo_codt"/></td>
                                    </tr>
                                </table>
                                <br><input class="but" type="submit" name="submit" value=" NEXT > ">
                            </form><br><br>
                            
                            <%
                            rs.close();
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
