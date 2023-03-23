package fr.acme.CRM.repository;

import fr.acme.CRM.model.Commande;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Transactional
public interface CommandeRepository extends JpaRepository<Commande, Integer> {

    @Query(value = "select * from commande where id=:id", nativeQuery = true)
    List<Commande> findByIdCommande(@Param("id") int id);
}
