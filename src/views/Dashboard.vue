<template>
<div>
    
  <BooksTable />
</div>
  
</template>
<script>
import BooksTable from '../components/BooksTable.vue';
// import NewItem from '../components/NewItem.vue'
export default {

  name:'Dashboard',
  components:{
    BooksTable
    
  }

}
</script>