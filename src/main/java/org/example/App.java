package org.example;

import org.example.model.Director;
import org.example.model.Movie;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Optional;


public class App {
    public static void main(String[] args) {
        Configuration configuration = new Configuration().addAnnotatedClass(Director.class).addAnnotatedClass(Movie.class);

        SessionFactory sessionFactory = configuration.buildSessionFactory();

        try (Session session = sessionFactory.getCurrentSession()) {
            session.beginTransaction();
            Director director = session.get(Director.class, 2);
            System.out.println("Режиссер: "+director.getName());
            System.out.println("Его фильмы:");
            for (Movie movie:director.getMovieList()
                 ) {
                System.out.println(movie.getName());
            }

            Movie movie = session.get(Movie.class, 3);
            System.out.println("Фильм "+movie.getName()+" режиссер "+ movie.getDirector().getName());            

            //Новый режиссер с добавлением нового фильма - сохранение по каскаду - используется save гибернэйта, можно merge jpa
            Director director1 = new Director("Михалков", 80);
            System.out.println("Режиссер: "+director1.getName());
            Movie movie1 = new Movie("Утомленные солнцем4", 2020);
            movie1.setDirector(director1);
            director1.setMovieList(new ArrayList<>(Collections.singletonList(movie1))); //avoid nullPointer
            session.save(director1); //movie1.save выполняется по каскаду

            System.out.println("Фильм "+movie1.getName()+" добавляем режиссеру "+ director1.getName());
            System.out.println("Фильмы режиссера после добавления:");
            for (Movie movie_:director1.getMovieList()
            ) {
                System.out.println(movie_.getName());
            }

            Director director2 = session.get(Director.class, 3);
            Movie movie2 = session.get(Movie.class, 3);
            Director oldDirector = movie2.getDirector();
            System.out.println("Фильм "+movie2.getName()+" с режиссером "+ movie2.getDirector().getName()+" меняет режиссера на "+ director2.getName());
            movie2.setDirector(director2);
            if (director2.getMovieList()!=null) {
                director2.getMovieList().add(movie2); //для верного кэша гибернэйт
            } else {
                System.out.println("director2.getMovieList() is NULL!!!");
            }
            if (oldDirector.getMovieList()!=null) {
            oldDirector.getMovieList().remove(movie2); } else {
                System.out.println("oldDirector.getMovieList() is NULL!!!");
            }
            session.save(movie2);

            Director director3 = session.get(Director.class, 2);
            if (director3.getMovieList()!=null && director3.getMovieList().size()>0 && Optional.ofNullable(director3.getMovieList().get(0)).isPresent()) {
                Movie movie3 = director3.getMovieList().get(0);
                System.out.println("Удаляю фильм " + movie3.getName() + " у режиссера " + director3.getName());
                director3.getMovieList().remove(movie3);
                session.remove(movie3);
            }
            session.getTransaction().commit();
        }
    }
}
