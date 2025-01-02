<script>
  export default {
    name: "SampleAudio",
    props: {
      sampleAudio: {
        type: String,
        required: true,
      },
    },
  }
</script>

<template>
  <div v-if="sampleAudio" class="audio-player">
    <audio controls :src="sampleAudio"></audio>
  </div>
</template>

<style scoped>
</style>
