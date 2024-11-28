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
        <h1>Pesquisa - Geral (Modo Tabela)</h1>        
        <%                    
            //Select "Geral" //Modificar aqui

            TarefaDAO tareDAO = new TarefaDAO();
            
            List<Tarefa> lista = new ArrayList<>();
            lista = tareDAO.consPesqTarefa();
            
            int n_reg = 0 ;
            out.println("<br> <b>Tarefas</b>");
            
        %>    
        <table style="width: 100%"; border="1">
            <tr>
                <th>#</th>
                <th>Id.</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Dificuldade</th>
                <th>Responsavel</th>

            </tr>                          
            
        <%   
            for( int i = 0; i <= lista.size()-1; i++){                
        %>        
            <tr>
                <td><%= n_reg+1 %> </td>
                <td><%= lista.get(i).getId() %> </td>
               <%-- <td><%= lista.get(i).getDt_pesq() %> </td>--%>
                <td><%= lista.get(i).getNome()%></td>
                <td><%= lista.get(i).getDescricao()%></td>
                <td><%= lista.get(i).getDificuldade()%></td>
                <td><%= lista.get(i).getResponsavel()%></td>

            </tr>                                                 
        <%
                n_reg++;                           
            }
        %>
        </table>
        <%                                                     
            out.println("<b>Registros: </b>" + n_reg + "<br>");
            out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");  
        %>
        
        
    </body>
</html>
