<template>
<div>
    <h2>Expoted Data</h2>
    <v-spacer></v-spacer>
    <v-simple-table dark>
       <template v-slot:default>
        <thead >
            <tr>
             <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>City</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(user, index) in users" :key="index">
                <td v-text="user.name"></td>
                <td v-text="user.email"></td>
                <td v-text="user.phone"></td>
                <td v-text="user.address.city"></td>
            </tr>
        </tbody>
       </template>
    </v-simple-table>
</div>
</template>
<script>
import axios from 'axios'
export default {
    name:'ElementTable',
    data(){
        return{
            users:[]
        }
        
    },
    created(){
        this.getResponse()
    },
    methods:{
        async getResponse(){
            try{
            const response = await axios.get("http://jsonplaceholder.typicode.com/users")
            this.users = response.data
            console.log(this.users)
            }
            catch (error){
                console.log(error)
            }
             


    },
    }
}
</script>