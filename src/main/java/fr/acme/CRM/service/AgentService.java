package fr.acme.CRM.service;

import fr.acme.CRM.model.Agent;

import java.util.List;

public interface AgentService {

    public List<Agent> get();
    public Agent get(int id);
    public Agent get(String loginOrEmail);
    public void save(Agent agent);
    public void update(Agent agent);
    public void delete(int id);
}
