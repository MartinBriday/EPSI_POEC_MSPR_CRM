package fr.acme.CRM.service;

import fr.acme.CRM.model.Commande;
import fr.acme.CRM.repository.CommandeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommandeServiceImpl implements CommandeService {

    @Autowired
    private CommandeRepository commandeRepository;

    @Override
    public List<Commande> get() {
        return commandeRepository.findAll();
    }

    @Override
    public List<Commande> get(int id) {
        return commandeRepository.findByIdCommande(id);
    }
}
