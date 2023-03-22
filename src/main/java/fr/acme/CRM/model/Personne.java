
package fr.acme.CRM.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.*;

@Entity
@Table
@Data
@NoArgsConstructor
@AllArgsConstructor
@Inheritance(strategy = InheritanceType.JOINED)
public class Personne {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String nom;

    private String prenom;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateNaissance;

    private String email;

    private String telephone;

    @Column(length = 5)
    private String codePostal;

    private String ville;

    private String rue;

    private String numeroRue;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "idEntreprise", nullable = false)
    private Entreprise entreprise;

    public Personne(String nom, String prenom, Date dateNaissance, String email, String telephone, String codePostal, String ville, String rue, String numeroRue) {
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaissance = dateNaissance;
        this.email = email;
        this.telephone = telephone;
        this.codePostal = codePostal;
        this.ville = ville;
        this.rue = rue;
        this.numeroRue = numeroRue;
    }
}