
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>

        <%
            Map<String, Integer> datos = (Map<String, Integer>) request.getAttribute("datos");
            int montoTotal = (int) request.getAttribute("monto");
        %>

        <div class="card m-3 p-3" style="width: 35rem">
            <h1>Pagos:</h1>
            <table class="table text-center">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Operario</th>
                        <th scope="col">Monto a Pagar</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                for (Map.Entry<String, Integer> entry : datos.entrySet()) {
                    String operario = entry.getKey();
                    int total = entry.getValue(); 
                    %>
                    <tr>
                        <th scope="row"><%=operario%></th>
                        <td><%=total%></td>
                    </tr>
                    <%}%>
                </tbody>
                <tfoot>
                    <tr>
                        <td>Monto Total:</td>
                        <td><%=montoTotal%></td>
                    </tr>
                    </tfoot>
            </table>
             <a href="/EjercicioPractico/operarios.jsp">Ir a Operarios</a>       
        </div>
    </body>
</html>
