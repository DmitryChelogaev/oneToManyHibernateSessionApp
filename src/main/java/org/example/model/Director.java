package org.example.model;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="director")
public class Director {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column (name ="name", length = 100)
    @NotEmpty(message="Name must be not empty")
    private String name;

    @Column(name = "age")
    private int age;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Movie> getMovieList() {
        return movieList;
    }

    public void setMovieList(List<Movie> movieList) {
        this.movieList = movieList;
    }

    @OneToMany(mappedBy = "director")
    @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
    List<Movie> movieList;


    public Director(String name, int age) {
        this.name = name;
        this.age = age;
    }


    public Director() {

    }

    public int getDirectorId() {
        return id;
    }

    public void setDirectorId(int directorId) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
