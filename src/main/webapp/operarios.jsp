<%-- 
    Document   : operarios.jsp
    Created on : 14 oct. 2023, 16:42:22
    Author     : jose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Operarios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>

        <% String error = (String) request.getAttribute("error");%>

        <div class="card m-3 p-3" style="width: 35rem">
            <form action="numOperarios" method="post">
                <h1>Operarios</h1>
                <div class="row mb-3">
                    <label class="col-form-label col-6" for="numOperarios">Ingrese el numero de operarios:</label>
                    <div class="col-6">
                        <input class="form-control" type="text" name="numOperarios" id="numOperarios" value="${param.numOperarios}">
                        <span><%=(error != null) ? error : ""%></span>
                    </div>
                </div>
                <div class="row">
                    <div class="d-grid gap-2 col-4 mx-auto">
                        <button type="sumbit" class="btn btn-warning">Aceptar</button>
                    </div>
                </div>
            </form>
        </div>

    </body>
</html>
