
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

}