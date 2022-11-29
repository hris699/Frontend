<template>
  <v-container>
    <hello-world />
    <ElementTable />
  </v-container>
</template>

<script>
  import HelloWorld from '../components/HelloWorld'
  import ElementTable from '../components/ElementTable'

  export default {
    name: 'Home',

    components: {
      HelloWorld,
      ElementTable
    },
  }
</script>
