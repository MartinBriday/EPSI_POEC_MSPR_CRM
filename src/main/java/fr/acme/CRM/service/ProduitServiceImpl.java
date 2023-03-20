package fr.acme.CRM.service;

import fr.acme.CRM.model.Produit;
import fr.acme.CRM.repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProduitServiceImpl implements ProduitService {

    @Autowired
    private ProduitRepository produitRepository;

    @Override
    public List<Produit> get() {
        return produitRepository.findAll();
    }

    @Override
    public Produit get(int id) {
        return produitRepository.findById(id).get();
    }

    @Override
    public Produit save(Produit produit) {
        return produitRepository.save(produit);
    }

    @Override
    public Produit update(Produit produit) {
        return produitRepository.save(produit);
    }

    @Override
    public void delete(int id) {
        produitRepository.deleteById(id);
    }
}
