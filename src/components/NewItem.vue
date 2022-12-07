<template>
  <div>
    <v-toolbar flat>
    
    <v-toolbar-title>Books Table</v-toolbar-title>
    <v-divider
          class="mx-4"
          inset
          horizontal
        ></v-divider>
    <v-dialog
      v-model="dialog"
      width="500"
      transition="dialog-top-transition"
    >
    <v-spacer></v-spacer>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="success"
          dark
          class="pa-2 mb-auto"
          v-bind="attrs"
          v-on="on"
        ><v-icon
          dark
          left
        >
          mdi-plus
        </v-icon>
          Add Book
        </v-btn>
      </template>

      <v-card>
        <v-card-title>
          {{formTitle}}
        </v-card-title>
        <v-card-text>
        <v-container>
          <v-row>
            <v-col
              cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="listItem.name" label='Book Name'>
              </v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="listItem.author" label='Author'></v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="listItem.genre" label='Genre'></v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="listItem.pages" label='Pages'></v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="listItem.published" label='Published'></v-text-field>
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
            @click="close()"
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
  </v-toolbar>
  </div>
</template>
<script>
  export default {
    data: () =>({
      dialog:false,
      listItem:''
    }),
    props:{
      editBook:Boolean,
      editItem:Object,
      editIndex:Number
    },
    computed: {
      formTitle() {
        return this.editIndex === -1 ? "New Book" : "Edit Book";
      },
  },
    watch: {
      editBook(){
        if (this.editBook){
            this.dialog= true
        }else{
          this.close()
        }
        this.listItem = this.editItem;
      },
       
    },
    methods:{

      close() {
        this.dialog = false;
        this.$nextTick(() => {
        this.listItem = Object.assign({}, this.defaultItem);
        this.addIndex = -1;
      });
    },
      save(){
        this.$emit("addBook",this.listItem)
        this.$emit('show',this.editBook)
        this.$emit("closeDialog",this.dialog)
        this.dialog=false;
      },
    }

  }
</script>