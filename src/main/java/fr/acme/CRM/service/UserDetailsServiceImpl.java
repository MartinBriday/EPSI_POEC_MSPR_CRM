package fr.acme.CRM.service;

import fr.acme.CRM.model.Agent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private AgentService agentService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Agent agent = agentService.get(username);
        if (agent == null) {
            throw new UsernameNotFoundException("L'agent \"" + username + "\" n'existe pas dans la BDD.");
        }
        return new User(agent.getLogin(), agent.getPassword(), getListeGrantedAuthority(agent));
    }

    private List<GrantedAuthority> getListeGrantedAuthority(Agent agent) {
        List<GrantedAuthority> listeGrantedAuthorities = new ArrayList<>();

        listeGrantedAuthorities.add(new SimpleGrantedAuthority(agent.getRole()));

        return listeGrantedAuthorities;
    }
}
