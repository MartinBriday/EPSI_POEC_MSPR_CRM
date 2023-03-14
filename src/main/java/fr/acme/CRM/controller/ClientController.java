package fr.acme.CRM.controller;

import fr.acme.CRM.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/clients")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @GetMapping("index")
    public String getClientIndex(Model model) {
        model.addAttribute("clients", clientService.get());
        return "client_index";
    }
}
