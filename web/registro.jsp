<%-- 
    Document   : registro
    Created on : 1/05/2021, 09:09:17 PM
    Author     : Studio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
        //aqui ya puedo incorporar codigo java
        Connection con = null;
        Statement set = null;
        ResultSet rs = null;
        
        String url, userName, password, driver;
        
        url = "jdbc:mysql://localhost/examen";
        userName = "root";
        password = "04022004";
        
        driver = "com.mysql.jdbc.Driver";
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(url, userName, password);
            
            //diferentes vistas para los errores
            //error exclusivo de sql
            try{
                set = con.createStatement();
                //necesito los parametros del formulario
                String nombre, appat, apmat, calle, alcaldia, q;
                int num_casa, interior, dia_nac, mes_nac, ano_nac, tel_particular, tel_celular, edad;
                
                nombre = request.getParameter("nombre");
                appat = request.getParameter("appat");
                apmat = request.getParameter("apmat");
                calle = request.getParameter("calle");
                alcaldia = request.getParameter("alcaldia");
                num_casa = Integer.parseInt(request.getParameter("num_casa"));
                interior = Integer.parseInt(request.getParameter("interior"));
                edad = Integer.parseInt(request.getParameter("edad"));
                dia_nac = Integer.parseInt(request.getParameter("dia_nac"));
                mes_nac = Integer.parseInt(request.getParameter("mes_nac"));
                ano_nac = Integer.parseInt(request.getParameter("ano_nac"));
                tel_particular = Integer.parseInt(request.getParameter("tel_particular"));
                tel_celular = Integer.parseInt(request.getParameter("tel_celular"));
                                
                q = "insert into registrousuario(nombre, appat, apmat, calle, alcaldia, num_casa, interior, dia_nac, mes_nac, ano_nac, tel_particular, tel_celular) "
                        + "values ('"+nombre+"', '"+appat+"', '"+apmat+"', '"+calle+"', '"+alcaldia+"', "+num_casa+", "+interior+", "+dia_nac+", "+mes_nac+", "+ano_nac+", "+tel_particular+", "+tel_celular+", "+tel_particular+")";
                
                int registro = set.executeUpdate(q);
                %>
                <h1>Registro Exitoso</h1>
                <%
                set.close();
            
            }catch(SQLException ed){
                System.out.println("Error al registrar en la tabla");
                System.out.println(ed.getMessage());
                
                %>
                <h1>Registro No Exitoso, error en la lectura de la tabla</h1>
                <%
            
            }
            con.close();
        
        }catch(Exception e){
            System.out.println("Error al conectar bd");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            %>
            <h1>Sitio en Construccion</h1>
            <%
        
        }
            
            %>
        
        
        
        
        
        <a href="index.html" >Regresar a la Pagina Principal</a>
    </body>
</html>