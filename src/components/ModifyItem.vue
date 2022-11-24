<template>
    <div>
    <v-dialog
      v-model="dialog"
      width="500"
    >
    <v-spacer></v-spacer>
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
    </div>
</template>
<script>
export default {
    
}
</script>

