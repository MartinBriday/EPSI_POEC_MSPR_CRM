package fr.acme.CRM.service;


import fr.acme.CRM.model.Client;

import java.util.List;

public interface ClientService {

    public List<Client> get();
    public Client get(int id);
    public void save(Client client);
    public void update(Client client);
    public void delete(int id);
}
