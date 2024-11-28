<%-- 
    Document   : pesquisa
    Created on : 24 de out. de 2024, 21:03:29
    Author     : alunocmc
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Tarefa"%>
<%@page import="model.dao.TarefaDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tarefa</h1>
        <%
        //Entrada/Receber
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String dificuldade = request.getParameter("dificuldade");
        String responsavel = request.getParameter("responsavel");

        // Instância e atrib de valor
        Tarefa tare = new Tarefa();
        tare.setNome(nome);
        tare.setDescricao(descricao);
        tare.setDificuldade(dificuldade);
        tare.setResponsavel(responsavel);
               
        //pesq.setDt_pesq(new Date());
        //String dt_atual_str = (new SimpleDateFormat("dd/MM/yyyy").format(new Date()));        
        //pesq.setDt_pesq(new SimpleDateFormat("yyyy/MM/dd").parse(dt_atual_str)); De String para Date
        
        
        //Insert
        TarefaDAO tareDAO = new TarefaDAO();
        try{
                if (tareDAO.insTarefa(tare)){    // Insere e retorna o resultado (true / false).
                //Acesso Permitido
                out.println("Registro inserido com sucesso!!!");
                }else{
                //Acesso Negado
                out.println("Erro ao cadastrar os dados!!!");   
                out.println("teste");
                }   
            }catch(Exception ex ){
                out.print(ex); 
               
            }; 
        
        %>
    </body>
</html>
