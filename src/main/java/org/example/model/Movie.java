package org.example.model;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="movie")
public class Movie {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "movie_id")
    private int movieId;

    public Movie() {
    }

    public Movie(String name, Integer yearOfProduction) {
        this.name = name;
        this.yearOfProduction = yearOfProduction;
    }

    @ManyToOne
    @JoinColumn (name="director_id", referencedColumnName = "id")
    private Director director;

    @Column(name = "name", length = 100)
    @NotEmpty(message="Name must be not empty")
    private String name;

    @Column(name = "year_of_production")
    private Integer yearOfProduction;

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getYearOfProduction() {
        return yearOfProduction;
    }

    public void setYearOfProduction(Integer yearOfProduction) {
        this.yearOfProduction = yearOfProduction;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
}
