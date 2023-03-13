package fr.acme.CRM.service;

import fr.acme.CRM.model.Client;
import fr.acme.CRM.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientRepository clientRepository;

    @Override
    public List<Client> get() {
        return clientRepository.findAll();
    }

    @Override
    public Client get(int id) {
        return clientRepository.findById(id).get();
    }

    @Override
    public void save(Client client) {
        clientRepository.save(client);
    }

    @Override
    public void update(Client client) {
        clientRepository.save(client);
    }

    @Override
    public void delete(int id) {
        clientRepository.deleteById(id);
    }
}
