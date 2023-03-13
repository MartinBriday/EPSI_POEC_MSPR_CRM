package fr.acme.CRM.service;

import fr.acme.CRM.model.Commande;

import java.util.List;

public interface CommandeService {

    public List<Commande> get();
    public List<Commande> get(int id);
}
