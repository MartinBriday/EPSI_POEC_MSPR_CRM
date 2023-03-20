
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
public class Commande {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "idClient", nullable = false)
    private Client client;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "idProduit", nullable = false)
    private Produit produit;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateCreation;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateLivraison;

    private int quantiteProduit;

}