<template>
  <div>
    <h1>{{ pageTitle }}</h1>
    <p>{{ pageContent }}</p>
  </div>
</template>

<script>
import { computed } from 'vue'

export default {
  name: 'Page',
  props: {
    title: {
      type: String,
      required: true,
    },
    content: {
      type: String,
      required: true,
    },
  },
  setup(props) {
    const pageTitle = computed(() => props.title.toUpperCase())
    const pageContent = computed(() => props.content)

    return {
      pageTitle,
      pageContent,
    }
  },
}
</script>

<style>
h1 {
  font-size: 2rem;
  margin-bottom: 1rem;
}

p {
  font-size: 1.2rem;
  line-height: 1.5;
}
</style>
