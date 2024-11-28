/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import model.Tarefa;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.ConectaDB;
/**
 *
 * @author alunocmc
 */
public class TarefaDAO {
    // Atrib.
    
    //Método
    public boolean insTarefa(Tarefa p_tar) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        //INSERT INTO tarefa(nome, dificuldade, responsavel) VALUES ('Fazer Café','descriação','baixa', 'Jhon');         
            String sql = "INSERT INTO tarefa(nome, descricao, dificuldade, responsavel) VALUES ('" + p_tar.getNome()+ "'," +
                                                                                   "'" + p_tar.getDescricao()+
                                                                                   "'" + p_tar.getDificuldade() +
                                                                                   "'" + p_tar.getResponsavel() + "')";
            
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }    
    
    public boolean delPesq(Tarefa p_tar) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        //DELETE from pesquisa WHERE id = 100
            String sql = "DELETE from pesquisa WHERE id = " + p_tar.getId();
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }   
        
    public Tarefa consTarefa(Tarefa p_tar) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();                                 
            String sql = "SELECT * FROM pesquisa where nome = '" + p_tar.getNome() + "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                p_tar.setNome(rs.getString("nome"));  
                p_tar.setDescricao("descricao");
                p_tar.setDificuldade(rs.getString("dificuldade"));                
                p_tar.setResponsavel(rs.getString("responsavel"));                
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return p_tar;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }    

    public Tarefa consTarefaId(Tarefa p_tar) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();                                 
            String sql = "SELECT * FROM tarefa where id = '" + p_tar.getId()+ "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                p_tar.setNome(rs.getString("nome"));
                p_tar.setDescricao(rs.getString("descricao"));
                p_tar.setDificuldade(rs.getString("dificuldade"));                
                p_tar.setResponsavel(rs.getString("responsavel"));
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return p_tar;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }    

    public List consPesqTarefa
        () throws ClassNotFoundException{        
        List lista = new ArrayList(); // Minha Lista querida!
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();                                 
            String sql = "SELECT * FROM tarefa";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {
                Tarefa pesq_tare = new Tarefa();
                pesq_tare.setId(Integer.parseInt(rs.getString("id"))); 
                pesq_tare.setNome(rs.getString("nome"));  
                pesq_tare.setDificuldade(rs.getString(""));                
                pesq_tare.setResponsavel(rs.getString(""));  
                lista.add(pesq_tare);
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }      
       
    public boolean altPesq(Tarefa p_tare) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        //UPDATE pesquisa SET nome='Jose da Silva', email='jose@umc.br', p1=3, p2=2, p3=1, p4=5, dt_pesq='2024-11-11' WHERE id = 8;
            String sql = "UPDATE tarefa SET nome='" + p_tare.getNome()+ "'," +
                                                "descricao='" + p_tare.getDescricao()+ "'," +
                                                "dificuldade='" + p_tare.getDificuldade()+ "'," +
                                                "responsavel=" + p_tare.getResponsavel()+ ", " +
                                                "' WHERE id = " + p_tare.getId();
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    } 
}
