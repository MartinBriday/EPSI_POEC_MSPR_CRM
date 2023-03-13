package fr.acme.CRM;

import fr.acme.CRM.model.Produit;
import fr.acme.CRM.service.ProduitServiceImpl;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MsprApplication {

	public static void main(String[] args) {
		SpringApplication.run(MsprApplication.class, args);
		ProduitServiceImpl produitService = new ProduitServiceImpl();
		produitService.save(new Produit());
	}

}
