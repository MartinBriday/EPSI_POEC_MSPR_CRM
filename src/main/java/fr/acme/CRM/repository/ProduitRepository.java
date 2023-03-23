package fr.acme.CRM.repository;

import fr.acme.CRM.model.Produit;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public interface ProduitRepository extends JpaRepository<Produit, Integer> {
}
