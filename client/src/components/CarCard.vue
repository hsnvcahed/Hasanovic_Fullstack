<template>
  <v-card class="d-flex flex-column" min-height="700">
    <v-img max-height="400" :src="carData.image"></v-img>

    <v-card-title>
      {{ carData.title }} <span v-if="carData.status == 'sold'"> *RESERVED*</span>
    </v-card-title>

    <v-card-subtitle>
      Owner:
      <span class="font-weight-bold">
        {{ carData.first_name }}
        {{ carData.last_name }}
      </span>
    </v-card-subtitle>
    <v-card-subtitle>
      Year: <span class="font-weight-bold">{{ carData.year_of_make }}</span>
    </v-card-subtitle>
    <v-card-subtitle>
      Miles:<span class="font-weight-bold"> {{ carData.miles }}</span>
    </v-card-subtitle>
    <v-card-subtitle>
      Price:<span v-if="carData.status != 'sold'" class="font-weight-bold"> {{ carData.price }}</span>
      <span class="font-weight-bold" v-else>N/A</span>
    </v-card-subtitle>

    <v-card-actions>
      <div style="width:100%" class="d-flex justify-end" v-if="carData.status != 'sold'">
        <v-btn :to="'/details/' + carData.id" class="purple white--text lighten-2" text>
          Details
        </v-btn>
      </div>

      <v-spacer></v-spacer>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  props: {
    carData: {
      type: Object,
    },
  },
};
</script>

<style lang="scss" scoped></style>
