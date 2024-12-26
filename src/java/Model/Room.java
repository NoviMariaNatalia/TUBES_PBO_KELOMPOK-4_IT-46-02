/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Novi Maria Natalia
 */

public class Room {
    private int id;
    private int buildingId;
    private String name;
    private int floor;
    private int capacity;
    private String facilities;
    private String photo;
    
    // Constructor tanpa ID
    public Room(int buildingId, String name, int floor, int capacity, String facilities, String photo) {
        this.buildingId = buildingId;
        this.name = name;
        this.floor = floor;
        this.capacity = capacity;
        this.facilities = facilities;
        this.photo = photo;
    }
    
    // Constructor dengan ID
    public Room(int id, int buildingId, String name, int floor, int capacity, String facilities, String photo) {
        this.id = id;
        this.buildingId = buildingId;
        this.name = name;
        this.floor = floor;
        this.capacity = capacity;
        this.facilities = facilities;
        this.photo = photo;
    }
    
    public Room(int id) {
        this.id = id;
    }
    
    // Getter dan Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getBuildingId() { return buildingId; }
    public void setBuildingId(int buildingId) { this.buildingId = buildingId; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public int getFloor() { return floor; }
    public void setFloor(int floor) { this.floor = floor; }
    
    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }
    
    public String getFacilities() { return facilities; }
    public void setFacilities(String facilities) { this.facilities = facilities; }
    
    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }
}
