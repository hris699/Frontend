<template>
    <div>
        <NewItem v-on:addBook="addData($event)"/>
        <ModifyItem />
        <v-data-table
            :headers="headers"
            :items="books"
            :items-per-page="10"
            class="elevation-1"
        > 
        </v-data-table>
    </div>
</template>
<script>
import NewItem from '../components/NewItem.vue'
import ModifyItem from '../components/ModifyItem.vue'
export default {
    name:'BooksTable',
    components:{
        NewItem,
        ModifyItem
    },
    data: () => ({
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
      ]
  }),
  methods:{
    addData(event){
        console.log(this.books.unshift(event))
    }

  }
}
</script>

