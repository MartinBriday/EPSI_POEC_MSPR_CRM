class Commande {

    clearFormValidations () {
        this.commandeForm.classList.remove('was-validated');
    }
    
    clearDialogFields () {        
        let fields = $(this.commandeForm).find("[data-id]");
        fields.each ((index, field) => {
            let name = $(field).attr("data-id");
            $(field).val (null);
        });
    }

    showCommandeDialog (commandeId) {
        this.clearFormValidations();
        if (this.dialog === undefined) {
            this.dialog = new bootstrap.Modal(document.getElementById('commande-modal'));
        }
        this.clearDialogFields();
        if (commandeId !== undefined && commandeId !== null) {
            let commande = this.rows[commandeId];
            let fields = $(this.commandeForm).find("[data-id]");
            fields.each ((index, field) => {
                let name = $(field).attr("data-id");
                $(field).val (commande[name]);
            });

        }

        this.dialog.show();
    }

    hideCommandeDialog () {
        if (this.dialog !== undefined) this.dialog.hide();
    }
    
    clearTable () {
        this.commandeTable.html ('');
    }
    
    createEditDeleteButtons (commandeId) {
        return `<td>
        <a class="edit-button" title="" id="edit-${commandeId}" data-id="${commandeId}" data-toggle="tooltip" data-original-title="Edit"><i class="material-icons"></i></a>
        <a class="delete-button" title="" id="delete-${commandeId}" data-id="${commandeId}" data-toggle="tooltip" data-original-title="Delete"><i class="material-icons"></i></a>
        </td>`;    
    }

    addEditDeleteListeners (commandeId) {
        let editButtons = $("#edit-"+commandeId);		
        let deleteButtons = $("#delete-"+commandeId);		
   
        editButtons.on ('click', (e) => {
            let id = $(e.target).parent().data('id');
            this.showCommandeDialog(id);
        });		
    
        deleteButtons.on ('click', (e) => {
            let id = $(e.target).parent().data('id');        
            
            bootbox.confirm ("Are you sure you want to delete this commande ? ", (result) => {
                if (result) {
                    this.delete(id, (e) => {
                       delete this.rows[id];
                       this.displayRows();
                    });
                }
            });

        });		        
    }

    addRow (commande) {

        let row = `<tr>
            <td>${commande.id}</td>
            <td>${client.id}</td>
            <td>${produit.id}</td>
            <td>${commande.dateCreation}</td>
            <td>${commande.dateLivraison}</td>
            <td>${commande.Quantité_Produit}</td>
            ${this.createEditDeleteButtons(commande.id)}
        </tr>`;
    
        this.commandeTable.append(row);

        this.addEditDeleteListeners (commande.id);
    }
    
    displayRows () {

        this.clearTable();

        for (const [id, commande] of Object.entries(this.rows)) {
            this.addRow (commande);
        }
          
    }

    delete (commandeId, callback) {
        $.ajax({
           
            type: "DELETE",
            url: "/test-ajax/commande-delete.php?id="+commandeId
        }).done ((data) => {
            callback (true, data);
        });  
    }

    load () {
    
        this.rows = {};

        $.ajax({
            url: "/test-ajax/commande-list.php"
        }).done ((data) => {
            console.log(data);
            data.forEach ((row) => {
                this.rows[row.id] = row;
            });
            this.displayRows();
        });
    }
    
    submit (data, callback) {
        
        $.ajax({
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            contentType: "application/json",
            url: "/test-ajax/commande-post.php"
        }).done ((data) => {
            callback (true, data);
        });      
        
    
    }

    save (callback) {

        commande = {};
        let fields = $(this.commandeForm).find("[data-id]");
        fields.each ((index, field) => {
            let name = $(field).attr("data-id");
            let val = $(field).val();
            commande[name] = val;
        });  
        this.submit(commande, callback);


    }

    submitTest () {
        let commande = {
            id: 555,
            id : 777,
            id: 222,
            dateCreation: "14/01/1976",
            dateLivraison:"14/01/1976",
            Quantité_Produit: 123456,
          
        };
        this.submit(commande);
    }

    initialize () {

        this.rows = {};

        this.commandeTable = $("#commande-table tbody");
        this.commandeForm = $("#commande-form")[0];
        this.saveCommande = $("#save-commande")[0];
    
        this.saveCommande.addEventListener('click', (e) => {
            if (!this.commandeForm.checkValidity()) {
                this.commandeForm.classList.add('was-validated');			
            }
            else {
                this.save((success, data) => {
                    this.hideCommandeDialog();
                    this.rows[data.id] = data;
                    this.displayRows();                    
                });
            }
        });
    
    
        let addButtons = $(".add-button");
        addButtons.on ('click', (e) => {
            this.showCommandeDialog();
        });        

        this.load();
    }
}

const button = document.querySelector('button');

button.addEventListener('click', event => {
  button.innerHTML = `Nombre de clics : ${event.detail}`;
});


$(document).ready(() => {

    commande = new Commande();
    commande.initialize ();

});