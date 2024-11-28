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
        <h1>Pesquisa - Geral / Lista</h1>
        <%                    
            //Select "Geral"

            TarefaDAO tarefaDAO = new TarefaDAO();
            
            List<Tarefa> lista = new ArrayList<>();
            lista = tarefaDAO.consPesqTarefa();
            
            int n_reg = 0 ;
            out.println("<br> <b>Pesquisa de Tarefa</b>");
            //out.println("<br> <b>Reg# | Nome | Descrição: | Dificuldade | Responsavel</b> <br>");
           // out.println("<br> <b>-------------------------------------------</b> <br>");
            for( int i = 0; i < lista.size(); i++){                
                out.println(i + " - " + //lista.get(i).getDt_pesq() #Caso queira colocar a data
                 " - " + lista.get(i).getNome() + " - " + lista.get(i).getDescricao() + 
                 " - " + lista.get(i).getDificuldade() + " - " + lista.get(i).getResponsavel() + "<br>");                                          
                n_reg++;                           
            }
            out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");
            out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");  

        %>
    </body>
</html>
