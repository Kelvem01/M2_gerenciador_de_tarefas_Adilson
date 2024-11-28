<%-- 
    Document   : index
    Created on : 28 de out. de 2024, 21:11:41
    Author     : alunocmc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Tarefa"%>
<%@page import="model.dao.TarefaDAO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresa - Consulta Geral</title>
    </head>
    <body>
        <h1>Pesquisa - Geral / Registros</h1>
        <%                    
            //Select "Geral"

            TarefaDAO tareDAO = new TarefaDAO();
            
            List<Tarefa> lista = new ArrayList<>();
            lista = tareDAO.consPesqTarefa();
            
            int n_reg = 0 ;
            out.println("<br> <b>Pesquisa de Satisfação</b>");
            
            for( int i = 0; i <= lista.size()-1; i++){                
                out.println("<br><br> #: " + i);                
                //out.println("<br> Data: " + lista.get(i).getDt_pesq()); #caso queira colocar data
                out.println("<br> Nome: " + lista.get(i).getNome());
                out.println("<br> Descrição: " + lista.get(i).getDescricao());
                out.println("<br> Dificuldade: " + lista.get(i).getDificuldade());
                out.println("<br> Responsavel: " + lista.get(i).getResponsavel());                           
                n_reg++;                           
            }
            out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");
            out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");  

        %>
    </body>
</html>
