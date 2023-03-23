package fr.acme.CRM.controller;

import fr.acme.CRM.model.Agent;
import fr.acme.CRM.model.Client;
import fr.acme.CRM.model.Entreprise;
import fr.acme.CRM.model.Produit;
import fr.acme.CRM.service.AgentService;
import fr.acme.CRM.service.ClientService;
import fr.acme.CRM.service.EntrepriseService;
import fr.acme.CRM.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;

@Controller
public class MainController {

    @Autowired
    private EntrepriseService entrepriseService;

    @Autowired
    private AgentService agentService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private ProduitService produitService;

    @GetMapping("/init")
    public void init() {
        Entreprise e = new Entreprise("123456789", "ACME", Date.valueOf("2000-01-01"), "44000", "Nantes", "Avenue de la République", "1");
        entrepriseService.save(e);

        Produit p1 = new Produit("Bombe", "ACME", "Explosif", 15.36, 15, 150, "");
        Produit p2 = new Produit("Ressorts", "ACME", "Support", 89.36, 10, 250, "");
        Produit p3 = new Produit("Brique", "ACME", "Contondant", 0.42, 25, 6000, "");
        p1.setEntreprise(e);
        p2.setEntreprise(e);
        p3.setEntreprise(e);
        produitService.save(p1);
        produitService.save(p2);
        produitService.save(p3);

        Client c1 = new Client("Dupond", "Pierre", Date.valueOf("1965-12-12"), "p.dupond@gmail.com", "0601010101", "44000", "Nantes", "Rue du président Carnot", "12", Date.valueOf("2010-10-10"));
        Client c2 = new Client("Dupont", "Marie", Date.valueOf("1976-05-05"), "m.dupont@gmail.com", "0602020202", "69000", "Lyon", "Avenue général de Gaule", "20 Bis", Date.valueOf("2012-04-04"));
        c1.setEntreprise(e);
        c2.setEntreprise(e);
        clientService.save(c1);
        clientService.save(c2);

        BCryptPasswordEncoder bcpe = new BCryptPasswordEncoder();
        Agent a1 = new Agent("Briday", "Martin", Date.valueOf("1993-08-10"), "martin.briday@epsi.fr", null, null, null, null, null, "bridaym", bcpe.encode("bridaym"), "ADMIN");
        a1.setEntreprise(e);
        agentService.save(a1);

        e.setProduits(new ArrayList<>(Arrays.asList(p1, p2, p3)));
        e.setClients(new ArrayList<>(Arrays.asList(c1, c2)));
        e.setAgents(new ArrayList<>(Arrays.asList(a1)));

//        entrepriseService.save(e);
    }

    @GetMapping("/login")
    public String getLogin(Model model) {
        return "login";
    }

    @GetMapping("/accueil")
    public String getAccueil() {
        return "accueil";
    }
}
