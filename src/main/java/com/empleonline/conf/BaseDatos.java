/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empleonline.conf;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

/**
 *
 * @author MrMonterrosa
 */
public class BaseDatos {

    public MongoClient client;
    public MongoDatabase database;

    public  BaseDatos() {
        client = new MongoClient("localhost",27017);
        database = client.getDatabase("empleonline");        
    }

}
