<template>
  {{ collection.organization_name }}: {{ collection.collected_at }}
  <ul>
    <li v-for="indicator in collection.collection_indicators">
      {{ indicator.name }}: {{ indicator.value }} {{ indicator.unit }}
    </li>
  </ul>
</template>

<script>
  export default {
    props: ['collection']
  };
</script>
