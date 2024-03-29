class Client {

    clearFormValidations () {
        this.clientForm.classList.remove('was-validated');
    }
    
    clearDialogFields () {        
        let fields = $(this.clientForm).find("[data-id]");
        fields.each ((index, field) => {
            let name = $(field).attr("data-id");
            $(field).val (null);
        });
    }

    showClientDialog (clientId) {
        this.clearFormValidations();
        if (this.dialog === undefined) {
            this.dialog = new bootstrap.Modal(document.getElementById('client-modal'));
        }
        this.clearDialogFields();
        if (clientId !== undefined && clientId !== null) {
            let client = this.rows[clientId];
            let fields = $(this.clientForm).find("[data-id]");
            fields.each ((index, field) => {
                let name = $(field).attr("data-id");
                $(field).val (client[name]);
            });

        }

        this.dialog.show();
    }

    hideClientDialog () {
        if (this.dialog !== undefined) this.dialog.hide();
    }
    
    clearTable () {
        this.clientTable.html ('');
    }
    
    createEditDeleteButtons (clientId) {
        return `<td>
        <a class="edit-button" title="" id="edit-${clientId}" data-id="${clientId}" data-toggle="tooltip" data-original-title="Edit"><i class="material-icons"></i></a>
        <a class="delete-button" title="" id="delete-${clientId}" data-id="${clientId}" data-toggle="tooltip" data-original-title="Delete"><i class="material-icons"></i></a>
        </td>`;    
    }

    addEditDeleteListeners (clientId) {
        let editButtons = $("#edit-"+clientId);		
        let deleteButtons = $("#delete-"+clientId);		
   
        editButtons.on ('click', (e) => {
            let id = $(e.target).parent().data('id');
            this.showClientDialog(id);
        });		
    
        deleteButtons.on ('click', (e) => {
            let id = $(e.target).parent().data('id');        
            
            bootbox.confirm ("Voulez-vous vraiment supprimer ce client ? ", (result) => {
                if (result) {
                    this.delete(id, (e) => {
                       delete this.rows[id];
                       this.displayRows();
                    });
                }
            });

        });		        
    }

    addRow (client) {

        let row = `<tr>
            <td>${client.id}</td>
            <td>${client.nom}</td>
            <td>${client.prenom}</td>
            <td>${client.dateNaissance}</td>
            <td>${client.email}</td>
            <td>${client.telephone}</td>
            <td>${client.codePostal}</td>
            <td>${client.ville}</td>
            <td>${client.rue}</td>
            <td>${client.numeroRue}</td>
            ${this.createEditDeleteButtons(client.id)}
        </tr>`;
    
        this.clientTable.append(row);

        this.addEditDeleteListeners (client.id);
    }
    
    displayRows () {

        this.clearTable();

        for (const [id, client] of Object.entries(this.rows)) {
            this.addRow (client);
        }
          
    }

    delete (clientId, callback) {

        var headers = {};
        headers[this.header] = this.token;

        $.ajax({
            type: "DELETE",
            headers: headers,
            url: "/clients/index/delete/"+clientId
        }).done ((data) => {
            callback (true, data);
        });  
    }

    load () {
    
        this.rows = {};

        $.ajax({
            type: "GET",
            url: "/clients/index/read",
            dataType: "json"
        }).done ((data) => {
            console.log(data);
            data.forEach ((row) => {
                this.rows[row.id] = row;
            });
            this.displayRows();
        });
    }
    
    submit (data, callback) {

        var headers = {};
        headers[this.header] = this.token
        
        $.ajax({
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: headers,
            contentType: "application/json",
            url: "/clients/index/save"
        }).done ((data, status) => {
            callback (true, data);
        });      
        
    
    }

    save (callback) {

        client = {};
        let fields = $(this.clientForm).find("[data-id]");
        fields.each ((index, field) => {
            let name = $(field).attr("data-id");
            let val = $(field).val();
            client[name] = val;
        });  
        this.submit(client, callback);


    }

    initialize () {

        this.token = $("meta[name='_csrf']").attr("content");
        this.header = $("meta[name='_csrf_header']").attr("content");

        this.rows = {};

        this.clientTable = $("#client-table tbody");
        this.clientForm = $("#client-form")[0];
        this.saveClient = $("#save-client")[0];
    
        this.saveClient.addEventListener('click', (e) => {
            if (!this.clientForm.checkValidity()) {
                this.clientForm.classList.add('was-validated');			
            }
            else {
                this.save((success, data) => {
                    this.hideClientDialog();
                    this.rows[data.id] = data;
                    this.displayRows();                    
                });
            }
        });
    
    
        let addButtons = $(".add-button");
        addButtons.on ('click', (e) => {
            this.showClientDialog();
        });        

        this.load();
    }
}



$(document).ready(() => {

    client = new Client();
    client.initialize ();

});