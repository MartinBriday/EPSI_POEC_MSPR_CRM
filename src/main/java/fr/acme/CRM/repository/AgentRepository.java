package fr.acme.CRM.repository;

import fr.acme.CRM.model.Agent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AgentRepository extends JpaRepository<Agent, Integer> {

    @Query(value = "select p.id, p.nom, p.prenom, p.date_naissance, p.email, p.telephone, p.code_postal, p.ville, p.rue, p.numero_rue, p.id_entreprise, a.login, a.password, a.role, a.id_agent from agent as a, personne as p where a.id_agent = p.id and (a.login=:login or p.email=:login)", nativeQuery = true)
    Agent findByLoginOrEmail(@Param("login") String login);
}
