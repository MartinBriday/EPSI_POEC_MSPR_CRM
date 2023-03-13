package fr.acme.CRM.service;

import fr.acme.CRM.model.Produit;
import fr.acme.CRM.repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProduitServiceImpl implements ProduitService {

    @Autowired
    ProduitRepository produitRepository;

    @Override
    public List<Produit> get() {
        return produitRepository.findAll();
    }

    @Override
    public Produit get(int id) {
        return produitRepository.findById(id).get();
    }

    @Override
    public void save(Produit produit) {
        produitRepository.save(produit);
    }

    @Override
    public void update(Produit produit) {
        produitRepository.save(produit);
    }

    @Override
    public void delete(int id) {
        produitRepository.deleteById(id);
    }
}
