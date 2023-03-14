
package fr.acme.CRM.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.*;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table
@Data
@NoArgsConstructor
@AllArgsConstructor
@PrimaryKeyJoinColumn(name = "id")
public class Client extends Personne {

    private Date dateCreation;

    @JsonIgnore
    @OneToMany(targetEntity = Commande.class, mappedBy = "client")
    private List<Commande> commandes = new ArrayList<>();

    public Client(String nom, String prenom, Date dateNaissance, String email, String telephone, String codePostal, String ville, String rue, String numeroRue, Date dateCreation) {
        super(nom, prenom, dateNaissance, email, telephone, codePostal, ville, rue, numeroRue);
        this.dateCreation = dateCreation;
    }
}