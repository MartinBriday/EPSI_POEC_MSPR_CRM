
package fr.acme.CRM.model;

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

    @OneToMany(targetEntity = Agent.class, mappedBy = "entreprise")
    private List<Agent> agents;

    @OneToMany(targetEntity = Client.class, mappedBy = "entreprise")
    private List<Client> clients;

    @OneToMany(targetEntity = Produit.class, mappedBy = "entreprise")
    private List<Produit> produits;

}