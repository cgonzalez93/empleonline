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
import com.mongodb.client.MongoCursor;
import java.util.ArrayList;
import java.util.List;
import org.bson.types.ObjectId;
import static com.mongodb.client.model.Filters.*;

/**
 *
 * @author MrMonterrosa
 */
public class PersonaController implements Crud {

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
        try {
            MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("persona", BasicDBObject.class);
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }
        return true;
    }
    
    public Persona finds(String _usuario, String _contrasenna) {
        Persona p = null;
        try {
            MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("persona", BasicDBObject.class);
            for (Persona pp : findAlls()) {
                if(pp.getUsuario().equals(_usuario) && pp.getContrasenna().equals(_contrasenna)){
                    if(pp.getTipo().equals("usuario")){                    
                        p = pp;
                    }else{
                        p = pp;
                    }
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }
        return p;
    }
    public boolean existe(String _usuario) {
        boolean b = false;
        try {
            for (Persona pp : findAlls()) {
                if(pp.getUsuario().equals(_usuario)){
                    b = true;
                }
                break;
            }
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }
        return b;
    }
    @Override
    public List<Object> findAll() {
        List<Object> personas = new ArrayList();
        return personas;
    }

    public List<Persona> findAlls() {
        List<Persona> personas = new ArrayList();
        MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("persona", BasicDBObject.class);
        try (MongoCursor<BasicDBObject> cursor = collection.find().iterator()) {
            while (cursor.hasNext()) {
                
                BasicDBObject theObj = cursor.next();
                
                String _id = ((ObjectId) theObj.get("_id")).toHexString();
                String nombre = (String) theObj.get("nombre");
                String apellido = (String) theObj.get("apellido");
                String usuario = (String) theObj.get("usuario");
                String contrasenna = (String) theObj.get("contrasenna");
                String tipo = (String) theObj.get("tipo");

                Persona persona = new Persona();
                persona.setId(_id);
                persona.setNombre(nombre);
                persona.setApellido(apellido);
                persona.setUsuario(usuario);
                persona.setContrasenna(contrasenna);
                persona.setTipo(tipo);

                personas.add(persona);

            }
        }
        return personas;
    }

}
