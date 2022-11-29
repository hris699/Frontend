<template>
  <div class="text-right">
    <v-dialog
      v-model="dialog"
      width="500"
      transition="dialog-top-transition"
    >
    <v-spacer></v-spacer>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="red lighten-2"
          dark
          class="pa-2 mb-auto"
          v-bind="attrs"
          v-on="on"
        >
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
  </div>
</template>
<script>
  export default {
    data: () =>({
      dialog:false,
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
        
        console.log(this.dialog)
        
      }
      
      
    },
    // created(){
    //   console.log(this.editBook)
    // },
    methods:{

      close() {
        this.dialog = false;
        this.$nextTick(() => {
        this.editItem = Object.assign({}, this.defaultItem);
        this.addIndex = -1;
        this.$emit("closeDialog",this.dialog)
      });
    },
      save(){
        this.$emit("addBook",this.editItem)
        this.$emit('show',this.editBook)
        this.dialog=false;
      },
    }

  }
</script>