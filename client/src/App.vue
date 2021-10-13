<template>
  <v-app>
    <LogoBar />
    <v-main>
      <router-view :cars="cars" />
    </v-main>
  </v-app>
</template>

<script>
import axios from 'axios';
import LogoBar from '@/components/LogoBar.vue';

export default {
  name: 'App',
  components: {
    LogoBar,
  },
  data: () => ({
    //
    cars: [],
  }),
  methods: {
    async getCars() {
      let result = await axios({
        url: 'http://localhost:3000/cars',
        method: 'GET',
      });

      console.log(result);
      this.cars = result.data;
    },
  },
  created() {
    this.getCars();
  },
};
</script>
