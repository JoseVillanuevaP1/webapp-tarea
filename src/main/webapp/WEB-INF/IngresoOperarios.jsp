<%-- 
    Document   : IngresoOperarios
    Created on : 14 oct. 2023, 17:11:10
    Author     : jose
--%>

<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso de Operarios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>

        <% int numOpe = (int) request.getAttribute("numOpe");
            Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
        %>

        <div class="d-flex justify-content-center mt-4">
            <div class="card p-2" style="width: 75rem"> 
                <form action="procesar" method="post">
                    <input type="hidden" name="numOp" value="<%=numOpe%>"/>
                    <table class="table">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Operario</th>
                                <th scope="col">Buzo(s/8.00)</th>
                                <th scope="col">Polos(s/5.00)</th>
                                <th scope="col">Shorts(s/6.00)</th>
                                <th scope="col">Medias(s/4.00)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < numOpe; i++) {%>
                            <tr>
                                <%
                                    String paramOp = "op" + (i + 1);
                                    String paramValOp = request.getParameter(paramOp);
                                    paramValOp = (paramValOp == null) ? "" : paramValOp;
                                %>

                                <th scope="row">

                                    <select class="form-select" name="<%=paramOp%>">
                                        <option value="Seleccione" <%=(paramValOp.equals("Seleccione")) ? "selected" : ""%>>Seleccione</option>
                                        <option value="Jorge Lopez" <%=(paramValOp.equals("Jorge Lopez")) ? "selected" : ""%>>Jorge Lopez</option>
                                        <option value="Mario Villar" <%=(paramValOp.equals("Mario Villar")) ? "selected" : ""%>>Mario Villar</option>
                                        <option value="Maria Alba" <%=(paramValOp.equals("Maria Alba")) ? "selected" : ""%>>Maria Alba</option>
                                        <option value="Angel Valdivia" <%=(paramValOp.equals("Angel Valdivia")) ? "selected" : ""%>>Angel Valdivia</option>
                                        <option value="Ana Flore" <%=(paramValOp.equals("Ana Flore")) ? "selected" : ""%>>Ana Flores</option>
                                        <option value="David Dia" <%=(paramValOp.equals("David Dia")) ? "selected" : ""%>>David Diaz</option>
                                        <option value="Alex Guerra" <%=(paramValOp.equals("Alex Guerra")) ? "selected" : ""%>>Alex Guerra</option>
                                        <option value="Angelica Vasquez" <%=(paramValOp.equals("Angelica Vasquez")) ? "selected" : ""%>>Angelica Vasquez</option>
                                    </select>
                                </th>
                                <td>
                                    <%
                                        String paramBuzo = "buzoOp" + (i + 1);
                                        String paramValBuzo = request.getParameter(paramBuzo);
                                        paramValBuzo = (paramValBuzo == null) ? "" : paramValBuzo;
                                    %>
                                    <input class="form-control" type="number" name="<%=paramBuzo%>" value="<%=paramValBuzo%>" required >
                                </td>
                                <td>
                                    <%
                                        String paramPolo = "polosOp" + (i + 1);
                                        String paramValPolo = request.getParameter(paramPolo);
                                        paramValPolo = (paramValPolo == null) ? "" : paramValPolo;
                                    %>
                                    <input class="form-control" type="number" name="<%=paramPolo%>" value="<%=paramValPolo%>" required>
                                </td>
                                <td>
                                    <%
                                        String paramshort = "shortsOp" + (i + 1);
                                        String paramValShort = request.getParameter(paramshort);
                                        paramValShort = (paramValShort == null) ? "" : paramValShort;
                                    %>
                                    <input class="form-control" type="number" name="<%=paramshort%>" value="<%=paramValShort%>" required>
                                </td>
                                <td>
                                    <%
                                        String paramMedias = "mediasOp" + (i + 1);
                                        String paramValMedias = request.getParameter(paramMedias);
                                        paramValMedias = (paramValMedias == null) ? "" : paramValMedias;
                                    %>
                                    <input class="form-control" type="number" name="<%=paramMedias%>" value="<%=paramValMedias%>" required>
                                </td>
                            </tr>
                            <%}%>     
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5">
                                    <div class="d-grid gap-2 col-2 mx-auto">
                                        <button type="sumbit" class="btn btn-warning">Procesar</button> 
                                    </div>
                                    <div class="d-grid gap-2 col-4 mx-auto text-center mt-2">
                                        <% if (errores != null && errores.containsKey("errOp")) {%>
                                        <div class="alert alert-danger" role="alert">
                                            <%=errores.get("errOp")%>
                                        </div>
                                        <%}%>
                                    </div>
                                    <div class="d-grid gap-2 col-4 mx-auto text-center mt-2">
                                        <% if (errores != null && errores.containsKey("errValues")) {%>
                                        <div class="alert alert-danger" role="alert">
                                            <%=errores.get("errValues")%>
                                        </div>
                                        <%}%>
                                    </div>

                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
