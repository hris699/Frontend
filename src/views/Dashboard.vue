<template>
  <v-data-table
    :headers="headers"
    :items="books"
    sort-by="author"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar
        flat
      >
        <v-toolbar-title>My CRUD</v-toolbar-title>
        <v-divider
          class="mx-4"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>
        <v-dialog
          v-model="dialog"
          max-width="500px"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="primary"
              dark
              class="mb-2"
              v-bind="attrs"
              v-on="on"
            >
              New Item
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.name"
                      label="Book name"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.author"
                      label="Author"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.genre"
                      label="Genre"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.pages"
                      label="Pages"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.published"
                      label="Published on"
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                color="blue darken-1"
                text
                @click="close"
              >
                Cancel
              </v-btn>
              <v-btn
                color="blue darken-1"
                text
                @click="save"
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
      </v-toolbar>
    </template>
    <template v-slot:item.actions="{ item }">
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
    <template v-slot:no-data>
      <v-btn
        color="primary"
        @click="initialize"
      >
        Reset
      </v-btn>
    </template>
  </v-data-table>
</template>
<script>
export default {
  data: () => ({
    dialog: false,
    dialogDelete: false,
    headers: [
      {
        text: "Book Name",
        align: "start",
        sortable: false,
        value: "name",
      },
      { text: "Author", value: "author" },
      { text: "Genre ", value: "genre" },
      { text: "Pages ", value: "pages" },
      { text: "Published", value: "published" },
      { text: "Actions", value: "actions", sortable: false },
    ],
    books: [],
    editedIndex: -1,
    editedItem: {
      name: "",
      author: '',
      genre: '',
      pages: 0,
      published: '',
    },
    defaultItem: {
      name: "",
      author: '',
      genre: '',
      pages: 0,
      published: '',
    },
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Item" : "Edit Item";
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      this.books = [
        {
          name: "Self-Portrait with Nothing",
          author: 'Aimee Pokwatka' ,
          genre: 'Fantasy',
          pages: 295,
          published: '18-10-22',
        },
        {
          name: "The Atlas Paradox",
          author: 'Olivie Blake ',
          genre: 'Fiction',
          pages: 400,
          published: '25-10-22',
        },
        {
          name: "Our Missing Hearts",
          author: 'Celeste Ng ',
          genre: 'Fiction',
          pages: 335,
          published: '04-09-22',
        },
        {
          name: "The Restless Dark",
          author: 'Erica Waters',
          genre: 'Thriller',
          pages: 224,
          published: '12-01-22',
        },
        {
          name: "Malice House",
          author: 'Megan Shepherd ',
          genre: 'Horror',
          pages: 384 ,
          published: '10-10-22',
        },
        {
          name: "Reckless Girls",
          author: 'Rachel Hawkins',
          genre: 'Thriller',
          pages: 320,
          published: '04-01-22',
        },
        {
          name: "The Socialite's Guide to Murder",
          author: 'S.K. Golden',
          genre: 'Mystery',
          pages: 320,
          published: '11-10-22',
        },
        {
          name: "Night of the Raven, Dawn of the Dove",
          author: 'Rati Mehrotra',
          genre: 'Fiction',
          pages: 387,
          published: '13-02-22',
        },
        {
          name: "The Luminaries",
          author: 'Susan Dennard ',
          genre: 'Horror',
          pages: 512,
          published: '04-09-22',
        },
        {
          name: "The Witch Hunt",
          author: 'Sasha Peyton Smith',
          genre: 'Fantasy',
          pages: 265,
          published: '07-06-22',
        },
      ];
    },

    editItem(item) {
      this.editedIndex = this.books.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.books.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.books.splice(this.editedIndex, 1);
      this.closeDelete();
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    save() {
      if (this.editedIndex > -1) {
        Object.assign(this.books[this.editedIndex], this.editedItem);
      } else {
        this.books.push(this.editedItem);
      }
      this.close();
    },
  },
};
</script>