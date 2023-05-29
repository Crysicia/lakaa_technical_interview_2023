
<template>
  <div class="bg-error text-white text-center">{{ errorMessage }}</div>
</template>

<script>

  export default {
    props: ['errors'],
    computed: {
      errorMessage() {
        let message = []
        for (let key in this.errors) {
            message.push(`${key}: ${this.errors[key]}`)
        }
        return  message.join(', ')
      }
    }
  };
</script>
