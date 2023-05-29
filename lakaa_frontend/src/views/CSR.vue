
<template>
  <h1>CSR</h1>

  <input v-model="newIndicator.name" placeholder="Indicator name" />
  <input v-model="newIndicator.unit" placeholder="Unit" />
  <input id="true" type="radio" v-model="newIndicator.required" v-bind:value="true">
  <label for="true">True</label>

  <input id="false" type="radio" v-model="newIndicator.required" v-bind:value="false">
  <label for="false">False</label>

  <button @click="create">New Indicator</button>

  <hr />

  <div v-for="indicator in indicators" class="collection">
    {{ indicator.name }}: {{ indicator.unit }}
    <input :id="`${indicator.id}-true`" type="radio" v-model="indicator.required" v-bind:value="true">
    <label :for="`${indicator.id}-true`">True</label>

    <input :id="`${indicator.id}-false`" type="radio" v-model="indicator.required" v-bind:value="false">
    <label :for="`${indicator.id}-false`">False</label>
    <button @click="update(indicator)">Update</button>
    <button @click="remove(indicator)">Delete</button>
  </div>

  <hr />

  <div v-for="collection in collections" class="collection">
    <CollectionCard :collection="collection" />
  </div>
</template>

<script>
  import CollectionService from "../services/collection.service";
  import IndicatorService from "../services/indicator.service";
  import CollectionCard from "../components/CollectionCard.vue";

  export default {
    components: { CollectionCard },
    data() {
      return {
        newIndicator: {
          name: '',
          unit: '',
          required: true,
        },
        collections: [],
        indicators: [],
      }
    },
    async mounted() {
      this.collections = await CollectionService.findAll();
      this.indicators = await IndicatorService.findAll();
    },
    methods: {
      reset() {
        this.newIndicator = {
          name: '',
          unit: '',
          required: true,
        };
      },

      async create() {
        const res = await IndicatorService.create(this.newIndicator);
        this.indicators.push(res.data);
        this.reset();
      },

      async update(indicator) {
       await IndicatorService.update(indicator);
      },

      async remove(indicator) {
       await IndicatorService.remove(indicator);
      }
    },
  };
</script>

<style scoped>
  .collection {
    margin: 10px;
    border: 1px solid white;
    border-radius: 10px;
  }

</style>
