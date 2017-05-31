<%@page import="java.util.List"%>
<%@page import="com.empleonline.model.Vacante"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.empleonline.controller.VacanteController"%>
<%@page import="com.empleonline.model.Persona"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    VacanteController vacanteController = new VacanteController();
    
    String data = request.getParameter("data").toString();
    
    if(data.equals("nuevo")){
        String nombre = request.getParameter("nombre").toString().trim();
        String descripcion = request.getParameter("descripcion").trim();
        String precio = request.getParameter("precio").toString().replace(".", "").replace(",", "");
        String ciudad = request.getParameter("ciudad").toString();
        String empresa = request.getParameter("empresa").toString();
        if(!nombre.isEmpty()&&!descripcion.isEmpty()&&!precio.isEmpty()&&!ciudad.isEmpty()){
            long price = Integer.parseInt(precio);
            Vacante vacante = new Vacante(nombre, descripcion, price, ciudad, empresa);
            if(vacanteController.create(vacante)){
                session.setAttribute("MSG", "ok");
            }else{
                session.setAttribute("MSG", "error");
            }
            
            response.sendRedirect("/empleoline/vacante.jsp");
        }else{
            session.setAttribute("MSG", "warning");
            response.sendRedirect("/empleoline/vacante.jsp");
        }        
    }else if (data.equals("delete")){
        String id = request.getParameter("id").toString();
        vacanteController.delete(id);
    }else if (data.equals("modificar")){
        String id = request.getParameter("idvacante").toString().trim();
        String nombre = request.getParameter("nombre").trim();
        String descripcion = request.getParameter("descripcion").trim();
        String precio = request.getParameter("precio").toString().trim().replace(".", "").replace(",", "");
        String ciudad = request.getParameter("ciudad").toString().trim();
        String empresa = request.getParameter("empresa").toString().trim();
        if(!nombre.isEmpty()&&!descripcion.isEmpty()&&!precio.isEmpty()&&!ciudad.isEmpty()&&!empresa.isEmpty()){
            Vacante v = new Vacante(id, nombre, descripcion, new Long(precio), ciudad, empresa);
            if(vacanteController.update(v)){
                session.setAttribute("MSG", "ok");
            }else{
                session.setAttribute("MSG", "error");
            }
            
            response.sendRedirect("/empleoline/principal.jsp");
        }else{
            session.setAttribute("MSG", "warning");
            response.sendRedirect("/empleoline/principal.jsp");
        }
        
    }else if (data.equals("postulado")){
        String idpersona = request.getParameter("idpersona");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String idvacante = request.getParameter("idvacante");
        if(!nombre.isEmpty()&&!idpersona.isEmpty()&&!nombre.isEmpty()&&!apellido.isEmpty()&&!idvacante.isEmpty()){
            Vacante v = new Vacante();
            v.setId(idvacante);
            Persona p = new Persona();
            p.setId(idpersona);
            p.setNombre(nombre);
            p.setApellido(apellido);
            vacanteController.addPostulado(p, v);
        }
    }
    
%>

