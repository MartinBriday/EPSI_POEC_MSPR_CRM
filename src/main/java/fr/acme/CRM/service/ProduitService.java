package fr.acme.CRM.service;

import fr.acme.CRM.model.Produit;

import java.util.List;

public interface ProduitService {

    public List<Produit> get();
    public Produit get(int id);
    public Produit save(Produit produit);
    public Produit update(Produit produit);
    public void delete(int id);
}
