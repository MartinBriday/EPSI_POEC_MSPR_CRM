
package fr.acme.CRM.model;

import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table
@Data
@NoArgsConstructor
@AllArgsConstructor
@PrimaryKeyJoinColumn(name = "id")
public class Agent extends Personne {

    private String login;

    private String password;

    private String role;

    public Agent(String nom, String prenom, Date dateNaissance, String email, String telephone, String codePostal, String ville, String rue, String numeroRue, String login, String password, String role) {
        super(nom, prenom, dateNaissance, email, telephone, codePostal, ville, rue, numeroRue);
        this.login = login;
        this.password = password;
        this.role = role;
    }
}