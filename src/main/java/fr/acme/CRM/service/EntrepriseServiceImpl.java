package fr.acme.CRM.service;

import fr.acme.CRM.model.Entreprise;
import fr.acme.CRM.repository.EntrepriseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EntrepriseServiceImpl implements EntrepriseService {

    @Autowired
    private EntrepriseRepository entrepriseRepository;

    @Override
    public List<Entreprise> get() {
        return entrepriseRepository.findAll();
    }

    @Override
    public Entreprise get(int id) {
        return entrepriseRepository.findById(id).get();
    }

    @Override
    public void save(Entreprise entreprise) {
        entrepriseRepository.save(entreprise);
    }
}
