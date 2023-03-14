
package fr.acme.CRM.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.util.*;

@Entity
@Table
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Entreprise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(unique = true, nullable = false, length = 9)
    private String siren;

    private String nom;

    private Date dateCreation;

    @Column(length = 5)
    private String codePostal;

    private String ville;

    private String rue;

    private String numeroRue;

    @JsonIgnore
    @OneToMany(targetEntity = Agent.class, mappedBy = "entreprise")
    private List<Agent> agents;

    @JsonIgnore
    @OneToMany(targetEntity = Client.class, mappedBy = "entreprise")
    private List<Client> clients;

    @JsonIgnore
    @OneToMany(targetEntity = Produit.class, mappedBy = "entreprise")
    private List<Produit> produits;

    public Entreprise(String siren, String nom, Date dateCreation, String codePostal, String ville, String rue, String numeroRue) {
        this.siren = siren;
        this.nom = nom;
        this.dateCreation = dateCreation;
        this.codePostal = codePostal;
        this.ville = ville;
        this.rue = rue;
        this.numeroRue = numeroRue;
    }
}