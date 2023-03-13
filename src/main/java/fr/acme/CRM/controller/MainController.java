package fr.acme.CRM.controller;

import fr.acme.CRM.model.Produit;
import fr.acme.CRM.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @Autowired
    private ProduitService produitService;

    @GetMapping("/init")
    public void init() {
        produitService.save(new Produit());
    }
}
