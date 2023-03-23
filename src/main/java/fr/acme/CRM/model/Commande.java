
package fr.acme.CRM.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
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
public class Commande {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Transient
    private int idClient;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "idClient", nullable = false)
    private Client client;

    @Transient
    private int idProduit;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "idProduit", nullable = false)
    private Produit produit;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateCreation;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateLivraison;

    private int quantiteProduit;

    public Commande(Client client, Produit produit, Date dateCreation, Date dateLivraison, int quantiteProduit) {
        this.client = client;
        this.produit = produit;
        this.dateCreation = dateCreation;
        this.dateLivraison = dateLivraison;
        this.quantiteProduit = quantiteProduit;
    }
}