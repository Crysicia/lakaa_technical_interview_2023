
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

  <div>
  	<div v-for="collection in collections" class="collection">
  		{{ collection.organization_name }}: {{ collection.collected_at }}
  		<ul>
			<li v-for="indicator in collection.collection_indicators">
				{{ indicator.name }}: {{ indicator.value }} {{ indicator.unit }}
			</li>
		</ul>
  	</div>
  </div>
</template>

<script>
  import CollectionService from "../services/collection.service";
  import IndicatorService from "../services/indicator.service";

  export default {
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
        console.log(await CollectionService.create(this.newCollection));
        this.reset();
      },

      async setIndicators() {
      	this.newCollection.indicators = await IndicatorService.findAll();
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
