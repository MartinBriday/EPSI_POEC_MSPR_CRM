package fr.acme.CRM.service;

import fr.acme.CRM.model.Agent;
import fr.acme.CRM.repository.AgentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AgentServiceImpl implements AgentService {

    @Autowired
    private AgentRepository agentRepository;

    @Override
    public List<Agent> get() {
        return agentRepository.findAll();
    }

    @Override
    public Agent get(int id) {
        return agentRepository.findById(id).get();
    }

    @Override
    public Agent get(String loginOrEmail) {
        return agentRepository.findByLoginOrEmail(loginOrEmail);
    }

    @Override
    public void save(Agent agent) {
        agentRepository.save(agent);
    }

    @Override
    public void update(Agent agent) {
        agentRepository.save(agent);
    }

    @Override
    public void delete(int id) {
        agentRepository.deleteById(id);
    }
}
