package fr.acme.CRM.controller;

import fr.acme.CRM.model.Client;
import fr.acme.CRM.service.ClientService;
import fr.acme.CRM.service.EntrepriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/clients")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @Autowired
    private EntrepriseService entrepriseService;

    @GetMapping("/index")
    public String getClientIndex() {
        return "client_index";
    }

    @GetMapping("/index/read")
    @ResponseBody
    public ResponseEntity<List<Client>> readClients() {
        return new ResponseEntity<>(clientService.get(), HttpStatus.OK);
    }

    @PostMapping("/index/save")
    @ResponseBody
    public ResponseEntity<Client> saveClient(@RequestBody Client client) {
        client.setEntreprise(entrepriseService.get(1));
        client.setDateCreation(Date.valueOf(LocalDate.now()));
        return new ResponseEntity<>(clientService.save(client), HttpStatus.CREATED);
    }

    @DeleteMapping("/index/delete/{id}")
    @ResponseBody
    public void deleteClient(@PathVariable("id") int id) {
        clientService.delete(id);
    }
}
