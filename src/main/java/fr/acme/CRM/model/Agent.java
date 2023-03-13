
package fr.acme.CRM.model;

import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table
@Data
@NoArgsConstructor
@PrimaryKeyJoinColumn(name = "id")
@AllArgsConstructor
public class Agent extends Personne {

    private String login;

    private String password;

    private String role;

}