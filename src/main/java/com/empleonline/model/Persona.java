/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empleonline.model;

/**
 *
 * @author MrMonterrosa
 */
public class Persona {
    private long _id;
    private String nombre;
    private String apellido;
    private String usuario;
    private String contrasenna;

    public Persona() {
    }

    public Persona(String nombre, String apellido, String usuario, String contrasenna) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.usuario = usuario;
        this.contrasenna = contrasenna;
    }

    public String getContrasenna() {
        return contrasenna;
    }

    public void setContrasenna(String contrasenna) {
        this.contrasenna = contrasenna;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public long getId() {
        return _id;
    }

    public void setId(long _id) {
        this._id = _id;
    }
    
}
