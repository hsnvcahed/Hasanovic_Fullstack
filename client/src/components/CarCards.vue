<template>
  <v-row class="d-flex flex-row flex-wrap justify-center">
    <v-col v-for="(car, i) in cars" :key="i" cols="4" style="min-width:300px"
      ><CarCard :carData="car" class="ma-2"
    /></v-col>
  </v-row>
</template>

<script>
import CarCard from '@/components/CarCard.vue';
export default {
  components: {
    CarCard,
  },
  props: {
    cars: {
      type: Array,
    },
  },
};
</script>
<style lang="scss" scoped></style>
