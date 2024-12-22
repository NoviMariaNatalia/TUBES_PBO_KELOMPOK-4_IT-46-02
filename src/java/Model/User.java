/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Novi Maria Natalia
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String role;  // admin atau mahasiswa
    
    // Constructor tanpa ID
    public User(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }
}