<template>
  <div class="text-right">
    <v-dialog
      v-model="dialog"
      width="500"
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
          Add New Book
        </v-card-title>
        <v-card-text>
        <v-container>
          <v-row>
            <v-col
              cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="addItem.name" label='Book Name'>
              </v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="addItem.author" label=Author></v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="addItem.genre" label='Genre'></v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="addItem.pages" label=Pages></v-text-field>
            </v-col>
            <v-col
            cols="12"
              sm="6"
              md="4">
              <v-text-field v-model="addItem.published" label=Published></v-text-field>
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
  </div>
</template>
<script>
  export default {
    data: () =>({
      dialog:false,
      addIndex:-1,
      addItem :{
        name:'',
        author:'',
        genre:'',
        pages:0,
        published:''

      },
      defaultItem :{
        name:'',
        author:'',
        genre:'',
        pages:0,
        published:''
      }
 
    }),
    methods:{

      close() {
        this.dialog = false;
        this.$nextTick(() => {
        this.addItem = Object.assign({}, this.defaultItem);
        this.addIndex = -1;
      });
    },
      save(){
        this.$emit("addBook",this.addItem)
        this.dialog=true;
      }

    }

  }
</script>