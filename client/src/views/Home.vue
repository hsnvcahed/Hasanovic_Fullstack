<template>
  <v-container>
    <CarCards style="width:100%" :cars="cars" />
  </v-container>
</template>

<script>
import CarCards from '@/components/CarCards.vue';
export default {
  name: 'Home',
  props: {
    cars: {
      type: Array,
    },
  },
  components: {
    CarCards,
  },
};
</script>
