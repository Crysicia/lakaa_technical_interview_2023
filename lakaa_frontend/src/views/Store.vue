
<template>
	<h1 class="is-center">Store</h1>

	<div class="card">
		<header><h4>Create collection</h4></header>
 		<FormError :errors="errorMessage" />
 		<div class="row">
			<div class="col">
  			<label for="organization_name">Organization name</label>
  			<input id="organization_name" v-model="newCollection.organization_name" placeholder="Organization name" />
			</div>
			<div class="col">
  			<label for="collected_at">Collection date</label>
				<input id="collected_at" v-model="newCollection.collected_at" type='date' placeholder="Collection date" />
 			</div>
		</div>

  		<h4>Indicators</h4>
  		<div class="container">
	  		<div class="row" v-for="indicator in newCollection.indicators">
	  			<div class="col">
		  			{{ indicator.name }}
	  			</div>
	  			<div class="col-3">
	  				<input v-model="indicator.value" placeholder="Indicator value" />
		  		</div>
		  		<div class="col">
		  			{{ indicator.unit }}
	  			</div>
	  		</div>
	  	</div>
  		<footer class="is-right">
  			<button class="button primary" @click="create">New collection</button>
  		</footer>
	</div>

	<h4 class="is-center">Past collections</h4>
	<hr />

	<div v-for="collection in collections">
		<CollectionCard :collection="collection" />
	</div>
</template>

<script>
  import CollectionService from "../services/collection.service";
  import IndicatorService from "../services/indicator.service";
  import CollectionCard from "../components/CollectionCard.vue";
  import FormError from "../components/FormError.vue";

  export default {
  	components: { CollectionCard, FormError },
    data() {
      return {
        newCollection: {
          organization_name: '',
          collected_at: '',
          indicators: [],
        },
        collections: [],
        errorMessage: ''
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
				this.errorMessage = ''
				this.setIndicators();
		  },

      async create() {
      	try {
	        const res = await CollectionService.create(this.newCollection);
	        this.collections.push(res.data);
	        this.reset();
      	} catch (error) {
      		this.errorMessage = error.response.data;
      	}
      },

      async setIndicators() {
      	this.newCollection.indicators = await IndicatorService.findAllRequired();
      },
    },
  };
</script>

<style scoped>
</style>
