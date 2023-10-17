package com.mycompany.ejerciciopractico;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletOperarios", urlPatterns = {"/ServletOperarios", "/numOperarios", "/procesar"})
public class ServletOperarios extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String path = request.getServletPath();
        
        if (path.equals("/numOperarios")) {

            String numOpe = request.getParameter("numOperarios");
            if (numOpe == null || numOpe.isBlank()) {
                request.setAttribute("error", "Ingrese el numero de Operarios");
                request.getRequestDispatcher("/operarios.jsp").forward(request, response);
            }
            {

                int numOpeInt;
                try {

                    numOpeInt = Integer.parseInt(numOpe);
                    request.setAttribute("numOpe", numOpeInt);
                    request.getRequestDispatcher("/WEB-INF/IngresoOperarios.jsp").forward(request, response);

                } catch (NumberFormatException e) {

                    request.setAttribute("error", "Ingrese un numero por favor");
                    request.getRequestDispatcher("/operarios.jsp").forward(request, response);
                }

            }
        } else if (path.equals("/procesar")) {
            
            Map<String, Integer> datos = new LinkedHashMap<>();
            Map<String, String> errores = new HashMap<>();
            Set<String> operariosProcesados = new HashSet<>();
            int monto = 0;
            int numOp = Integer.parseInt(request.getParameter("numOp"));
            
            for (int i = 0; i < numOp; i++) {

                String operario = request.getParameter("op" + (i + 1));
                
                if (operario.equals("Seleccione")) {
                    errores.put("errOp", "Seleccione todos los operarios");               
                } else if(operariosProcesados.contains(operario)) {
                    errores.put("errOp", "Operario repetido: " + operario);
                } else {
                    operariosProcesados.add(operario);
                }

                String buzos = request.getParameter("buzoOp" + (i + 1));
                String polos = request.getParameter("polosOp" + (i + 1));
                String shorts = request.getParameter("shortsOp" + (i + 1));
                String medias = request.getParameter("mediasOp" + (i + 1));

                int numBuzo = Integer.parseInt(buzos);

                if (numBuzo < 0) {
                    errores.put("errValues", "Las cantidades deben ser positivas");
                }

                int numPolo = Integer.parseInt(polos);
                if (numPolo < 0) {
                    errores.put("errValues", "Las cantidades deben ser positivas");
                }

                int numShort = Integer.parseInt(shorts);
                if (numShort < 0) {
                    errores.put("errValues", "Las cantidades deben ser positivas");
                }

                int numMedias = Integer.parseInt(medias);
                if (numMedias < 0) {
                    errores.put("errValues", "Las cantidades deben ser positivas");
                }

                int total = numBuzo * 8 + numPolo * 5 + numShort * 6 + numMedias * 4;
                datos.put(operario, total);
                monto = monto + total;
            }

            if (!datos.isEmpty() && errores.isEmpty()) {
                request.setAttribute("datos", datos);
                request.setAttribute("monto", monto);
                request.getRequestDispatcher("/WEB-INF/procesarDatos.jsp").forward(request, response);
            } else {
                request.setAttribute("numOpe", numOp);
                request.setAttribute("errores", errores);
                request.getRequestDispatcher("/WEB-INF/IngresoOperarios.jsp").forward(request, response);

            }

        }

    }

}
