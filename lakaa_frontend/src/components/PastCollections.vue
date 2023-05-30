<template>
  <h4 class="is-center">Past collections</h4>
  <hr />

  <div v-for="collection in collections">
    <CollectionCard :collection="collection" />
  </div>
</template>

<script>
  import CollectionCard from "../components/CollectionCard.vue";

  export default {
    components: { CollectionCard },
    props: ['collections'],
    computed: {
      collections() {
        return this.collections.sort((a, b) => {
          return new Date(b.collected_at) - new Date(a.collected_at);
        });
      }
    },
  };
</script>
