
<template>
  <h1 class="is-center">CSR</h1>
  <div class="card">
    <header><h4>Create indicator</h4></header>
    <FormError :errors="errorMessage" />
    <div class="row">
      <div class="col">
        <input v-model="newIndicator.name" placeholder="Indicator name" />
      </div>
      <div class="col">
        <input v-model="newIndicator.unit" placeholder="Unit" />
      </div>
      <div class="col">
        <span class="tag">Required</span>
        <input id="true" type="radio" v-model="newIndicator.required" v-bind:value="true">
        <label for="true">True</label>

        <input id="false" type="radio" v-model="newIndicator.required" v-bind:value="false">
        <label for="false">False</label>
      </div>
    </div>
    <footer class="is-right">
      <button class="button primary" @click="create">New Indicator</button>
    </footer>
  </div>

  <h4 class="is-center">Edit indicators</h4>
  <hr />

  <div class="card" v-for="indicator in indicators">
    <div class="row">
      <div class="col">
        Name: {{ indicator.name }}, Unit: {{ indicator.unit }}
      </div>

      <div class="col">
        <span class="tag">Required</span>
        <input :id="`${indicator.id}-true`" type="radio" v-model="indicator.required" v-bind:value="true">
        <label :for="`${indicator.id}-true`">True</label>

        <input :id="`${indicator.id}-false`" type="radio" v-model="indicator.required" v-bind:value="false">
        <label :for="`${indicator.id}-false`">False</label>
      </div>

      <button class="button secondary" @click="update(indicator)">Update</button>
      <button class="button error" @click="remove(indicator)">Delete</button>
    </div>
  </div>

  <PastCollections :collections="collections" />
</template>

<script>
  import CollectionService from "../services/collection.service";
  import IndicatorService from "../services/indicator.service";
  import PastCollections from "../components/PastCollections.vue";
  import FormError from "../components/FormError.vue";

  export default {
    components: { PastCollections, FormError },
    data() {
      return {
        newIndicator: {
          name: '',
          unit: '',
          required: true,
        },
        collections: [],
        indicators: [],
        errorMessage: ''
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
        }
        this.errorMessage = ''
      },

      async create() {
        try {
          const res = await IndicatorService.create(this.newIndicator);
          this.indicators.push(res.data);
          this.reset();
        } catch (error) {
          this.errorMessage = error.response.data;
        }
      },

      async update(indicator) {
        try {
          await IndicatorService.update(indicator);
        } catch (error) {
          this.errorMessage = error.response.data;
        }
      },

      async remove(indicator) {
        try {
          await IndicatorService.remove(indicator);
          this.indicators = this.indicators.filter(i => i.id !== indicator.id);
        } catch (error) {
          this.errorMessage = error.response.data;
        }
      }
    },
  };
</script>

<style scoped>
</style>
