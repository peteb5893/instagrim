/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.LinkedList;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author Administrator
 */
public class User {

    Cluster cluster;

    public User() {

    }

    // this boolean method will return true if the user is added to the database

    public boolean RegisterUser(String username, String Password, String email, String first_name, String last_name) {
        AeSimpleSHA1 sha1handler = new AeSimpleSHA1();
        String EncodedPassword = null;
        try {
            EncodedPassword = sha1handler.SHA1(Password);
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException et) {
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");

        if (usernameTaken(username)) {
            return false;
        }

        PreparedStatement ps = session.prepare("insert into userprofiles (login, email, first_name, last_name, password) Values(?,?,?,?,?)");

        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username, email, first_name, last_name, EncodedPassword));
            //We are assuming this always works.  Also a transaction would be good here !

        return true;
    }

    //this boolean method will check the if the username trying to be registered is already taken
    public boolean usernameTaken(String username) {
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login from userprofiles where login =?");
        BoundStatement boundState = new BoundStatement(ps);
        ResultSet rs = null;
        rs = session.execute(boundState.bind(username));
        if (rs.isExhausted()) {
            System.out.println("Username has not yet been taken.");
            return false;
        } else {
            for (Row row : rs) {
                String Username = row.getString("login");    // create variable Username and define as the login string value
                if (Username.compareTo(username) == 0) // check if the stored username matches the entered username,
                {
                    return true;
                }
            }
        }
        return false;
    }
    

    public boolean IsValidUser(String username, String Password) {
        AeSimpleSHA1 sha1handler = new AeSimpleSHA1();
        String EncodedPassword = null;
        try {
            EncodedPassword = sha1handler.SHA1(Password);
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException et) {
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim"); // connects to the instagrim cassandra database cluster

        PreparedStatement ps = session.prepare("select password from userprofiles where login =?"); // creates a new prepared statement for the query
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));  // to the variable username
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {
                String StoredPass = row.getString("password"); // create variable StoredPass and define as the password string
                if (StoredPass.compareTo(EncodedPassword) == 0)// check if the password matches the encoded password
                {
                    return true;
                }
            }
        }
        return false;
    }

    public LinkedList<String> getProfileForUser(String User) {
        LinkedList<String> userProfile = new LinkedList<>();
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select * from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        User));
        if (rs.isExhausted()) {
            System.out.println("No Profile returned");
            return null;
        } else {
            for (Row row : rs) {
                String username = row.getString("login");
                String first_name = row.getString("first_name");
                String last_name = row.getString("last_name");
                String email = row.getString("email");

                userProfile.add(username);
                userProfile.add(first_name);
                userProfile.add(last_name);
                userProfile.add(email);
            }
        }
        return userProfile;
    }
    
    public LinkedList<String> getAllUsers() {
        LinkedList<String> allUsers = new LinkedList<>();
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login from userprofiles");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        ));
        if (rs.isExhausted()) {
            System.out.println("No Users returned");
            return null;
        } else {
            for (Row row : rs) {
                String username = row.getString("login");
                System.out.println("username " + username);
                allUsers.add(username);      
            }
        }
        return allUsers;
    }

    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

}
