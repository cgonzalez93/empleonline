/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empleonline.controller;

import com.empleonline.conf.BaseDatos;
import com.empleonline.model.Persona;
import com.empleonline.model.Vacante;
import com.empleonline.repository.Crud;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.bson.types.ObjectId;

/**
 *
 * @author MrMonterrosa
 */
public class VacanteController implements Crud {

    private static BaseDatos baseDato = new BaseDatos();

    @Override
    public boolean create(Object c) {
        Vacante p = (Vacante) c;
        boolean v = false;
        // Pass BasicDBObject.class as the second argument
        try {
            MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("vacante", BasicDBObject.class);
            // insert a document
            BasicDBObject document = new BasicDBObject();
            document.append("nombre", p.getNombre());
            document.append("descripcion", p.getDescripcion());
            document.append("precio", Integer.parseInt(p.getPrecio().toString()));
            document.append("ciudad", p.getCiudad());
            document.append("empresa", new ObjectId(p.getEmpresa_id()));
            collection.insertOne(document);
            v = true;
        } catch (Exception e) {
            v = false;
        }
        return v;
    }

    @Override
    public boolean update(Object c) {
        Vacante p = (Vacante) c;
        try {
            MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("vacante", BasicDBObject.class);
            
            BasicDBObject document = new BasicDBObject();
            document.append("nombre", p.getNombre());
            document.append("descripcion", p.getDescripcion());
            document.append("precio", Integer.parseInt(p.getPrecio().toString()));
            document.append("ciudad", p.getCiudad());
            document.append("empresa", new ObjectId(p.getEmpresa_id()));
            
            BasicDBObject newDocument = new BasicDBObject();
            newDocument.append("$set", document);

            BasicDBObject searchQuery = new BasicDBObject().append("_id", new ObjectId(p.getId()));

            collection.updateOne(searchQuery, newDocument);
            return true;
        } catch (Exception e) {
            e.getStackTrace();
            return false;
        }        
    }

    public boolean addPostulado(Object c) {
        Persona p = (Persona) c;
        try {
            MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("vacante", BasicDBObject.class);
            BasicDBObject bobject = new BasicDBObject();
            bobject.append("_id", p.getId());
            BasicDBObject document = new BasicDBObject("postulados", new BasicDBObject("_id", p.getId()));
            DBObject listItem = document;
            DBObject updateQuery = new BasicDBObject("$push", listItem);
            
            BasicDBObject newDocument = new BasicDBObject();
            newDocument.append("$set", document);

            BasicDBObject searchQuery = new BasicDBObject().append("_id", new ObjectId(p.getId()));

            collection.updateOne(searchQuery, newDocument);
            return true;
        } catch (Exception e) {
            e.getStackTrace();
            return false;
        }        
    }
    
    @Override
    public boolean delete(Object c) {
        try {
            MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("vacante", BasicDBObject.class);
            String id = c.toString();
            collection.deleteOne(new BasicDBObject("_id", new ObjectId(id)));
            return true;
        }catch(Exception e){
            return false;
        }
    }

    @Override
    public Object find(long id) {
        try {
            MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("vacante", BasicDBObject.class);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return true;
    }

    public Vacante finds(String _id) {
        Vacante p = null;
        try {
            for (Vacante pp : findAlls()) {
                if(pp.getId().equals(_id)){
                    p = pp;
                }
            }
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }
        return p;
    }

    public boolean convocar(String _id) {
        MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("vacante", BasicDBObject.class);

        return true;
    }

    @Override
    public List<Object> findAll() {
        List<Object> personas = new ArrayList();
        return personas;
    }

    public List<Vacante> findAlls() {
        List<Vacante> vacantes = new ArrayList();
        MongoCollection<BasicDBObject> collection = baseDato.database.getCollection("vacante", BasicDBObject.class);
        try (MongoCursor<BasicDBObject> cursor = collection.find().iterator()) {
            while (cursor.hasNext()) {

                BasicDBObject theObj = cursor.next();

                String _id = ((ObjectId) theObj.get("_id")).toHexString();
                String nombre = (String) theObj.get("nombre");
                String descripcion = (String) theObj.get("descripcion");
                Integer precio = (Integer) theObj.get("precio");
                String ciudad = (String) theObj.get("ciudad");

                Vacante vacante = new Vacante();
                vacante.setId(_id);
                vacante.setNombre(nombre);
                vacante.setDescripcion(descripcion);
                vacante.setPrecio(Long.parseLong(precio.toString()));
                vacante.setCiudad(ciudad);

                vacantes.add(vacante);

            }
        }
        return vacantes;
    }

}
