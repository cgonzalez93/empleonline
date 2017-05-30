/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empleonline.controller;

import com.empleonline.conf.BaseDatos;
import com.empleonline.model.Persona;
import com.empleonline.repository.Crud;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoCollection;
import java.util.List;

/**
 *
 * @author MrMonterrosa
 */
public class PersonaController implements Crud{
    private static BaseDatos baseDato = new BaseDatos();
    @Override
    public boolean create(Object c) {
        Persona p = (Persona) c;
        // Pass BasicDBObject.class as the second argument
        MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("persona", BasicDBObject.class);

        // insert a document
        BasicDBObject document = new BasicDBObject();
        document.append("nombre", p.getNombre());
        document.append("apellido", p.getApellido());
        document.append("usuario", p.getUsuario());
        document.append("contrasenna", p.getContrasenna());
        collection.insertOne(document);
        return true;
    }

    @Override
    public boolean update(Object c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object find(long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Object> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
