package fr.acme.CRM.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import fr.acme.CRM.model.Client;
import fr.acme.CRM.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/clients")
public class ClientController {

    private final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

    @Autowired
    private ClientService clientService;

    @GetMapping("/index")
    public String getClientIndex(Model model) {
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
        return new ResponseEntity<>(clientService.save(client), HttpStatus.CREATED);
    }

    @DeleteMapping("/index/delete/{id}")
    @ResponseBody
    public void deleteClient(@PathVariable("id") int id) {
        clientService.delete(id);
    }
}
