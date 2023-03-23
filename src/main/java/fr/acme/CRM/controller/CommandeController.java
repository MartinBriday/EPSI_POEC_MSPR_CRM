package fr.acme.CRM.controller;

import fr.acme.CRM.model.Commande;
import fr.acme.CRM.service.ClientService;
import fr.acme.CRM.service.CommandeService;
import fr.acme.CRM.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/commandes")
public class CommandeController {

    @Autowired
    private CommandeService commandeService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private ProduitService produitService;

    @GetMapping("/index")
    public String getCommandeIndex(Model model) {
        model.addAttribute("produits", produitService.get());
        return "commande_index";
    }

    @GetMapping("/index/read")
    @ResponseBody
    public ResponseEntity<List<Commande>> readCommandes() {
        List<Commande> commandes = commandeService.get();
        for (Commande commande : commandes) {
            commande.setIdClient(commande.getClient().getId());
            commande.setIdProduit(commande.getProduit().getId());
        }
        return new ResponseEntity<>(commandes, HttpStatus.OK);
    }

    @PostMapping("/index/save")
    @ResponseBody
    public ResponseEntity<Commande> saveCommande(@RequestBody Commande commande) {
        commande.setClient(clientService.get(commande.getIdClient()));
        commande.setProduit(produitService.get(commande.getIdProduit()));
        if (commande.getDateCreation() == null) {
            commande.setDateCreation(Date.valueOf(LocalDate.now()));
        }
        return new ResponseEntity<>(commandeService.save(commande), HttpStatus.CREATED);
    }

    @DeleteMapping("/index/delete/{id}")
    @ResponseBody
    public void deleteCommande(@PathVariable("id") int id) {
        commandeService.delete(id);
    }
}
