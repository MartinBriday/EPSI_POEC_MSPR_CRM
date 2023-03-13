
package fr.acme.CRM.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Produit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String nom;

    private String marque;

    private String categorie;

    private double prix;

    private double tva;

    private int quantiteStock;

    private String description;

    @ManyToOne
    @JoinColumn(name = "idEntreprise", nullable = false)
    private Entreprise entreprise;

    @OneToMany(targetEntity = Commande.class, mappedBy = "produit")
    private List<Commande> commandes = new ArrayList<>();

}