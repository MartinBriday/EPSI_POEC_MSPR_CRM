class Produit {

    clearFormValidations () {
        this.produitForm.classList.remove('was-validated');
    }
    
    clearDialogFields () {        
        let fields = $(this.produitForm).find("[data-id]");
        fields.each ((index, field) => {
            let name = $(field).attr("data-id");
            $(field).val (null);
        });
    }

    showProduitDialog (produitId) {
        this.clearFormValidations();
        if (this.dialog === undefined) {
            this.dialog = new bootstrap.Modal(document.getElementById('produit-modal'));
        }
        this.clearDialogFields();
        if (produitId !== undefined && ptoduitId !== null) {
            let produit = this.rows[produitId];
            let fields = $(this.produitForm).find("[data-id]");
            fields.each ((index, field) => {
                let name = $(field).attr("data-id");
                $(field).val (produit[name]);
            });

        }

        this.dialog.show();
    }

    hideProduitDialog () {
        if (this.dialog !== undefined) this.dialog.hide();
    }
    
    clearTable () {
        this.produitTable.html ('');
    }
    
    createEditDeleteButtons (produitId) {
        return `<td>
        <a class="edit-button" title="" id="edit-${produitId}" data-id="${produitId}" data-toggle="tooltip" data-original-title="Edit"><i class="material-icons"></i></a>
        <a class="delete-button" title="" id="delete-${produitId}" data-id="${produitId}" data-toggle="tooltip" data-original-title="Delete"><i class="material-icons"></i></a>
        </td>`;    
    }

    addEditDeleteListeners (produitId) {
        let editButtons = $("#edit-"+produitId);		
        let deleteButtons = $("#delete-"+produitId);		
   
        editButtons.on ('click', (e) => {
            let id = $(e.target).parent().data('id');
            this.showProduitDialog(id);
        });		
    
        deleteButtons.on ('click', (e) => {
            let id = $(e.target).parent().data('id');        
            
            bootbox.confirm ("Are you sure you want to delete this produit ? ", (result) => {
                if (result) {
                    this.delete(id, (e) => {
                       delete this.rows[id];
                       this.displayRows();
                    });
                }
            });

        });		        
    }

    
    addRow (produit) {

        let row = `<tr>
            <td>${produit.id}</td>
            <td>${produit.Nom}</td>
            <td>${produit.Marque}</td>
            <td>${produit.Catégorie}</td>
            <td>${produit.Prix}</td>
            <td>${produit.TVA}</td>
            <td>${produit.Quantité_Stock}</td>
            <td>${produit.Description}</td>
           
            ${this.createEditDeleteButtons(produit.id)}
        </tr>`;
    
        this.produitTable.append(row);

        this.addEditDeleteListeners (produit.id);
    }
    
    displayRows () {

        this.clearTable();

        for (const [id, produit] of Object.entries(this.rows)) {
            this.addRow (produit);
        }
          
    }

    delete (produitId, callback) {
        $.ajax({
           
            type: "DELETE",
            url: "/test-ajax/produit-delete.php?id="+produitId
        }).done ((data) => {
            callback (true, data);
        });  
    }

    load () {
    
        this.rows = {};

        $.ajax({
            url: "/test-ajax/produit-list.php"
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
            url: "/test-ajax/produit-post.php"
        }).done ((data) => {
            callback (true, data);
        });      
        
    
    }

    save (callback) {

        produit = {};
        let fields = $(this.produitForm).find("[data-id]");
        fields.each ((index, field) => {
            let name = $(field).attr("data-id");
            let val = $(field).val();
            produit[name] = val;
        });  
        this.submit(produit, callback);


    }

    submitTest () {
        let produit = {
            id: 555,
            Nom: "Bloggs",
            Marque: "Joe",
            Catégorie: "14/01/1976",
            Prix: "1234567",
            TVA: "14 J",
            Quantité_Stock: "12000",
            Description: "Test ville",
          
           
        };
        this.submit(produit);
    }

    initialize () {

        this.rows = {};

        this.produitTable = $("#produit-table tbody");
        this.produitForm = $("#produit-form")[0];
        this.saveProduit = $("#save-produit")[0];
    
        this.saveProduit.addEventListener('click', (e) => {
            if (!this.produitForm.checkValidity()) {
                this.produitForm.classList.add('was-validated');			
            }
            else {
                this.save((success, data) => {
                    this.hideProduitDialog();
                    this.rows[data.id] = data;
                    this.displayRows();                    
                });
            }
        });
    
    
        let addButtons = $(".add-button");
        addButtons.on ('click', (e) => {
            this.showProduitDialog();
        });        

        this.load();
    }
}



$(document).ready(() => {

    produit = new Produit();
    produit.initialize ();

});