package com.codegym.model;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class User {

    protected int id;
    protected String name;
    protected String email;
    protected int idCountry;
    protected String password;

    public User() {
    }

    @NotEmpty
    @Pattern(regexp = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})", message = "Format password not right")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public User(String name, String email, int idCountry) {
        super();
        this.name = name;
        this.email = email;
        this.idCountry = idCountry;
    }

    public User(int id, String name, String email, int idCountry) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
        this.idCountry = idCountry;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


//    @NotEmpty (message = "Name not empty")
//    @Length(min = 3, max = 10 , message = "Lenght of Name form 3 - 10 character ")

    @NotEmpty(message = "tên không được trống ")
    @Length(max = 30, min = 3, message = "tên phải từ 3-30 ký tự")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @NotEmpty(message = "email không được trống")
    @Email(message = "nhập email không đúng")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdCountry() {
        return idCountry;
    }

    public void setIdCountry(int idCountry) {
        this.idCountry = idCountry;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", idCountry=" + idCountry +
                ", password='" + password + '\'' +
                '}';
    }
}
