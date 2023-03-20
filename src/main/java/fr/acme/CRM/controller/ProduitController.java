package fr.acme.CRM.controller;

import fr.acme.CRM.model.Produit;
import fr.acme.CRM.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/produits")
public class ProduitController {

    @Autowired
    private ProduitService produitService;

    @GetMapping("/index")
    public String getProduitIndex() {
        return "produit_index";
    }

    @GetMapping("/index/read")
    @ResponseBody
    public ResponseEntity<List<Produit>> readProduits() {
        return new ResponseEntity<>(produitService.get(), HttpStatus.OK);
    }

    @PostMapping("/index/save")
    @ResponseBody
    public ResponseEntity<Produit> saveProduit(@RequestBody Produit produit) {
        return new ResponseEntity<>(produitService.save(produit), HttpStatus.CREATED);
    }

    @DeleteMapping("/index/delete/{id}")
    @ResponseBody
    public void deleteProduit(@PathVariable("id") int id) {
        produitService.delete(id);
    }


}
