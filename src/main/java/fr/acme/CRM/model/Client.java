
package fr.acme.CRM.model;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.*;

@Entity
@Table
@Data
@NoArgsConstructor
@PrimaryKeyJoinColumn(name = "id")
@AllArgsConstructor
public class Client extends Personne {

    private Date dateCreation;

    @OneToMany(targetEntity = Commande.class, mappedBy = "client")
    private List<Commande> commandes = new ArrayList<>();

}