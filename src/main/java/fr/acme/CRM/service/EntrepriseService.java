package fr.acme.CRM.service;

import fr.acme.CRM.model.Entreprise;

import java.util.List;

public interface EntrepriseService {

    public List<Entreprise> get();
    public Entreprise get(int id);
    public void save(Entreprise entreprise);
}
