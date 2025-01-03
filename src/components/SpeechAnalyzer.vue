<template>
  <div class="speech-analyzer">
    <h2>Speech Analysis Results</h2>

    <div v-if="isLoading" class="loading">
      <p>Analyzing speech data...</p>
    </div>

    <div v-else-if="analysisResults">
      <h3>Analysis Complete</h3>
      <ul>
        <li><strong>State : </strong> {{ analysisResults.result }}</li>
        <li><strong>Language : </strong> {{ language }}</li>
        <li><strong>Data : </strong> {{ analysisResults.data }}</li>
      </ul>
    </div>

    <div v-else class="no-data">
      <p>No audio data provided. Please upload or record audio to analyze.</p>
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  name: "SpeechAnalyzer",
  props: {
    language:{
      type:String,
      required: true
    },
    audioData: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      isLoading: false,
      analysisResults: null,
    };
  },
  watch: {
    audioData: {
      immediate: true,
      handler(newAudioData) {
        if (newAudioData) {
          this.analyzeSpeech(newAudioData);
        }
      },
    },
  },
  methods: {
    async analyzeSpeech(audioData) {
      this.isLoading = true;
      this.analysisResults = null;
      const formData = new FormData();
      formData.append("file", audioData);
      formData.append("lang", this.language);

      let config = {
        method: 'post',
        maxBodyLength: Infinity,
        url:  `${import.meta.env.VITE_API_HOST}/stt/convert`,
        headers: {
          "Content-Type": "multipart/form-data",
        },
        data : formData
      };

      try {
        const response = await axios.request(config);
        this.analysisResults = response.data;
      } catch (error) {
        console.error("Speech analysis failed:", error);
      } finally {
        this.isLoading = false;
      }
    },
  },
};
</script>

<style>
.speech-analyzer {
  margin-top: 20px;
  padding: 20px;
  background: #f9f9f9;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  text-align: left;
  font-family: Arial, sans-serif;
}

h2 {
  color: #4caf50;
  text-align: center;
}

.audio-player {
  margin: 20px 0;
  text-align: center;
}

audio {
  width: 100%;
  max-width: 400px;
  outline: none;
}

.loading,
.no-data {
  text-align: center;
  font-size: 1.2rem;
  color: #999;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  margin: 10px 0;
  font-size: 1rem;
}

li strong {
  color: #333;
}
</style>
