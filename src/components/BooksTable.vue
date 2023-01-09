<template>
    <div>
        <NewItem :editBook='showDialog' :editItem="editedItem" :editIndex="editIndex"
         v-on:addBook="addData($event)"  @show="showDialog=false"  v-on:closeDialog="showDialog=false"/>
        <v-data-table
            :headers="headers"
            :items="books"
            :items-per-page="10"
            class="elevation-1"
        >    
        <template v-slot:[`item.action`]="{item}">
        <v-icon
          color='primary'
          small
          class="mr-2"
          @click="editItem(item)"
        >
          mdi-pencil
        </v-icon>
        <v-icon
          color='deep-orange'
          small
          @click="deleteItem(item)"
        >
          mdi-delete
        </v-icon>
      </template>
    </v-data-table>
            <v-toolbar> 
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card tile>
            <v-card-title class="text-h5">Are you sure you want to delete this item?</v-card-title>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="deep-purple" text @click="closeDelete">Cancel</v-btn>
              <v-btn color="deep-purple" text @click="deleteItemConfirm">OK</v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
        </v-toolbar>
    </div>
</template>
<script>
import NewItem from '../components/NewItem.vue'
export default {
    name:'BooksTable',
    components:{
        NewItem,
    },
    data: () => ({
    dialog: false,
    dialogDelete: false,
    showDialog :false,
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
      { text: "Published On", value: "published" },
      { text: "Actions",value:'action',sortable:false}     
    ],
    books: [
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
      ],
      editIndex:-1,
      editedItem: {
      name: "",
      author: '',
      genre: '',
      pages: 0,
      published: '',
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
    addData(event){
      if (this.editIndex > -1) {
          Object.assign(this.books[this.editIndex], this.editedItem)
        } else {
          this.books.unshift(event)       
           }
      this.editIndex =-1
    },
    editItem(item) {
      this.editIndex = this.books.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.showDialog=true;
    },
    deleteItem(item) {
      this.editIndex = this.books.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },
    deleteItemConfirm() {
      this.books.splice(this.editIndex, 1);
      this.closeDelete();
    },
    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editIndex = -1;
      });
    },
  }
}
</script>

