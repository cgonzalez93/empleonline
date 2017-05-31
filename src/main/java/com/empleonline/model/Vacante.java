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
public class Vacante {
    private String _id;
    private String nombre;
    private String descripcion;
    private Long precio;
    private String ciudad;
    private String empresa_id;

    public Vacante() {
    }

    public Vacante(String _id, String nombre, String descripcion, Long precio, String ciudad) {
        this._id = _id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.ciudad = ciudad;
    }
    
    public Vacante(String nombre, String descripcion, Long precio, String ciudad) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.ciudad = ciudad;
    }
    
    public Vacante(String nombre, String descripcion, Long precio, String ciudad,String empresa) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.ciudad = ciudad;
        this.empresa_id = empresa;
    }
    
    public Vacante(String _id,String nombre, String descripcion, Long precio, String ciudad,String empresa) {
        this._id = new String(_id);
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.ciudad = ciudad;
        this.empresa_id = empresa;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getId() {
        return _id;
    }

    public void setId(String _id) {
        this._id = _id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Long getPrecio() {
        return precio;
    }

    public void setPrecio(Long precio) {
        this.precio = precio;
    }

    public String getEmpresa_id() {
        return empresa_id;
    }

    public void setEmpresa_id(String empresa_id) {
        this.empresa_id = empresa_id;
    }
    
}
