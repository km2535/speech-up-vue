<template>
  <div class="upload-speech">
    <h1>Speech Analysis</h1>
    <p>Upload an audio file or record your voice to analyze speech patterns.</p>

    <!-- 오디오 업로드 -->
    <input type="file" @change="handleFileUpload" accept="audio/*" />
    <button @click="startRecording" :disabled="isRecording">Start Recording</button>
    <button @click="stopRecording" :disabled="!isRecording">Stop Recording</button>

<!--    <SpeechAnalyzer v-if="audioData" :audioData="audioData" />-->
  </div>
</template>

<script>
export default {
  name: "SpeechAnalyzer",
  data(){
    return {
      audioData: null,
      isRecording: false,
    }
  },
  methods:{
    handleFileUpload(event) {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          this.audioData = e.target.result;
        };
        reader.readAsDataURL(file);
      }
    },
    async startRecording() {
      try {
        this.isRecording = true;
        const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
        this.mediaRecorder = new MediaRecorder(stream);
        this.mediaRecorder.start();

        const chunks = [];
        this.mediaRecorder.ondataavailable = (event) => {
          chunks.push(event.data);
        };

        this.mediaRecorder.onstop = () => {
          const blob = new Blob(chunks, { type: 'audio/wav' });
          this.audioData = URL.createObjectURL(blob);
        };
      } catch (error) {
        console.error('Recording failed:', error);
      }
    },
    stopRecording() {
      this.isRecording = false;
      if (this.mediaRecorder) {
        this.mediaRecorder.stop();
      }
    },
  }
}
</script>

<style>
.upload-speech {
  max-width: 600px;
  margin: 0 auto;
  text-align: center;
  padding: 20px;
}

button {
  margin: 5px;
}
</style>
