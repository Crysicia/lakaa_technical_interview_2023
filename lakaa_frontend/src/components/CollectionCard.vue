<template>
  <div class="card">
    <div class="row">
      <div class="col">
        <h5>{{ collection.organization_name }}</h5>
      </div>
      <div class="col is-right">
        Date: {{ collection.collected_at }}
      </div>
    </div>
    <div class="container" v-for="indicator in collection.collection_indicators">
      {{ indicator.name }}: {{ indicator.value }} {{ indicator.unit }}
    </div>
  </div>
</template>

<script>
  export default {
    props: ['collection']
  };
</script>
