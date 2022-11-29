<template>
    <div>
    <v-toolbar>
    <v-dialog
      v-model="dialog"
      width="500"
    >
    <v-spacer></v-spacer>

      <v-card>
        <v-card-title>
          Edit Book
        </v-card-title>
        <v-card-text>
        <v-container>
          <v-row>
            <v-col
              cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="editItem.name" label='Book Name'>
              </v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="editItem.author" label=Author></v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="editItem.genre" label='Genre'></v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="editItem.pages" label=Pages></v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="editItem.published" label=Published></v-text-field>
            </v-col>
          </v-row>
        </v-container>

        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="primary"
            text
            @click="close"
          >
            Cancel
          </v-btn>
          <v-btn
            color="primary"
            text
            @click="save()"
          >
            Save
          </v-btn>
        </v-card-actions>
      </v-card>

    </v-dialog>
      <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5">Are you sure you want to delete this item?</v-card-title>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDelete">Cancel</v-btn>
              <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <template v-slot:[`item.action`]="{item}">
          
        <v-icon
          small
          class="mr-2"
          @click="editItem(item)"
        >
          mdi-pencil
        </v-icon>
        <v-icon
          small
          @click="deleteItem(item)"
        >
          mdi-delete
        </v-icon>
      </template>
    </v-toolbar>  
    </div>
</template>
<script>
export default {
    methods:{
    editItem(item) {
      // console.log(item)
      this.editedIndex = this.books.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      console.log('delete item call')
      this.editedIndex = this.books.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.books.splice(this.editedIndex, 1);
      this.closeDelete();
    },
    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },
    }
}
</script>

