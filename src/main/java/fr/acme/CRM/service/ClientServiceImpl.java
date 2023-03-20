package fr.acme.CRM.service;

import fr.acme.CRM.model.Client;
import fr.acme.CRM.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private EntrepriseService entrepriseService;

    @Override
    public List<Client> get() {
        return clientRepository.findAll();
    }

    @Override
    public Client get(int id) {
        return clientRepository.findById(id).get();
    }

    @Override
    public Client save(Client client) {
        client.setEntreprise(entrepriseService.get(1));
        client.setDateCreation(Date.valueOf(LocalDate.now()));
        return clientRepository.save(client);
    }

    @Override
    public Client update(Client client) {
        return clientRepository.save(client);
    }

    @Override
    public void delete(int id) {
        clientRepository.deleteById(id);
    }
}
