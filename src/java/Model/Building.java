/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Novi Maria Natalia
 */

public class Building {
    private int id;
    private String name;
    private String address;
    private String photo;
    
    // Constructor tanpa ID (untuk insert)
    public Building(String name, String address, String photo) {
        this.name = name;
        this.address = address;
        this.photo = photo;
    }
    
    // Constructor dengan ID (untuk select/update)
    public Building(int id, String name, String address, String photo) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.photo = photo;
    }
    
    public Building(int id) {
        this.id = id;
    }
    
    // Getter dan Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }
}
