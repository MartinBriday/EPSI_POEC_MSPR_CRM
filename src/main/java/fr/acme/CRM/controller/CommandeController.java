package fr.acme.CRM.controller;

import fr.acme.CRM.model.Commande;
import fr.acme.CRM.service.CommandeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/commandes")
public class CommandeController {

    @Autowired
    private CommandeService commandeService;

    @GetMapping("/index")
    public String getCommandeIndex() {
        return "commande_index";
    }

    @GetMapping("/index/read")
    @ResponseBody
    public ResponseEntity<List<Commande>> readCommandes() {
        return new ResponseEntity<>(commandeService.get(), HttpStatus.OK);
    }

    @PostMapping("/index/save")
    @ResponseBody
    public ResponseEntity<Commande> saveCommande(@RequestBody Commande commande) {
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
