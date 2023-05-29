
<template>
  <h1>Store</h1>

  <input v-model="newCollection.organization_name" placeholder="Organization name" />
  <input v-model="newCollection.collected_at" type='date' placeholder="Collection date" />
  <ul>
  	<li v-for="indicator in newCollection.indicators">
  		{{ indicator.name }}: {{ indicator.unit }}
  		<input v-model="indicator.value" placeholder="Indicator value" />
  	</li>
  </ul>
  <button @click="create">New collection</button>

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
        newCollection: {
          organization_name: '',
          collected_at: '',
          indicators: [],
        },
        collections: [],
      }
    },
    async mounted() {
	  this.collections = await CollectionService.findAll();
	  this.setIndicators();
	},
    methods: {
      reset() {
		this.newCollection = {
		  organization_name: '',
		  collected_at: '',
		  indicators: [],
		};
		this.setIndicators();
	  },

      async create() {
        const res = await CollectionService.create(this.newCollection);
        this.collections.push(res.data);
        this.reset();
      },

      async setIndicators() {
      	this.newCollection.indicators = await IndicatorService.findAllRequired();
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
