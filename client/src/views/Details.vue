<template>
  <v-row class="d-flex justify-center mt-7">
    <v-col cols="5">
      <v-card>
        <v-img height="500px" :src="filteredData.image"></v-img>
        <v-card-title class="mx-auto">
          {{ filteredData.title }} <span v-if="filteredData.status == 'sold'"> *RESERVED*</span>
        </v-card-title>

        <v-simple-table class="mx-5" dense>
          <template>
            <thead>
              <tr>
                <th>
                  Price
                </th>
                <th>
                  Miles
                </th>
                <th>
                  Year of Make
                </th>
                <th>
                  Current Owner
                </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>{{ filteredData.price }}</td>
                <td>{{ filteredData.miles }}</td>
                <td>{{ filteredData.year_of_make }}</td>
                <td>{{ filteredData.first_name }} {{ filteredData.last_name }}</td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>

        <v-card-text>
          {{ filteredData.description }}
        </v-card-text>
        <v-card-actions>
          <div style="width:100%" class="d-flex justify-start">
            <v-btn to="/" class="purple white--text lighten-2 ma-5" text>
              Go Back
            </v-btn>
            <v-spacer></v-spacer>
            <div v-if="filteredData.status != 'sold'">
              <v-btn @click="deleteCar()" class="red white--text darken-2 ma-5" text>
                Delete Car
              </v-btn>
            </div>
            <div v-if="filteredData.status != 'sold'">
              <v-btn @click="buyCar()" class="red white--text lighten-2 ma-5" text>
                Order Car
              </v-btn>
            </div>
          </div>

          <v-spacer></v-spacer>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import axios from 'axios';
export default {
  props: {
    id: {
      type: String,
    },
    cars: {
      type: Array,
    },
  },
  computed: {
    filteredData() {
      return this.cars.find((el) => el.id == this.id);
    },
  },
  methods: {
    async buyCar() {
      await axios({
        url: 'http://localhost:3000/cars/' + this.filteredData.id,
        method: 'PATCH',
        'content-type': 'application/json',
        data: {
          status: 'sold',
        },
      });
      this.$router.go();
    },
    async deleteCar() {
      const res = await axios({
        url: 'http://localhost:3000/cars/' + this.filteredData.id,
        method: 'DELETE',
      });
      console.log(res);
      this.$router.push('/');
      this.$router.go();
    },
  },
};
</script>

<style lang="scss" scoped></style>
