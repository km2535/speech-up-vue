<template>
  <div class="upload-speech">
    <h1>Speech Analysis</h1>
    <p>Upload an audio file or record your voice to analyze speech patterns.</p>

    <!-- 오디오 업로드 -->
    <div class="input-container">
      <input type="file" @change="handleFileUpload" accept="audio/*" id="file-upload" />
      <label for="file-upload" class="custom-file-upload">Upload Audio</label>
      <select @change="handleFileType" id="lang" class="custom-select">
        <option value="ko" >kor</option>
        <option value="en" >eng</option>
      </select>
    </div>

    <div class="button-container">
      <button @click="startRecording" :disabled="isRecording" class="record-button">
        {{ isRecording ? 'Recording...' : 'Start Recording' }}
      </button>
      <button @click="stopRecording" :disabled="!isRecording" class="stop-button">
        Stop Recording
      </button>
    </div>
    <SampleAudio v-if="sampleAudio" :sampleAudio="sampleAudio"/>
    <SpeechAnalyzer v-if="audioData" :audioData="audioData"  :language="language"/>
  </div>
</template>

<script>
import SpeechAnalyzer from '@/components/SpeechAnalyzer.vue'
import SampleAudio from '@/components/SampleAudio.vue'

export default {
  components: { SampleAudio, SpeechAnalyzer },
  data() {
    return {
      audioData: null,
      sampleAudio: null,
      language: 'ko',
      isRecording: false,
    }
  },
  methods: {
    handleFileType(event){
      this.language = event.target.value;
    },
    handleFileUpload(event) {
      const file = event.target.files[0]
      if (file) {
        const reader = new FileReader()
        reader.onload = () => {
          this.audioData = file;
          this.sampleAudio = reader.result;
        }
        reader.readAsDataURL(file)
      }
    },
    async startRecording() {
      try {
        this.isRecording = true
        const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
        this.mediaRecorder = new MediaRecorder(stream)
        this.mediaRecorder.start()

        const chunks = []
        this.mediaRecorder.ondataavailable = (event) => {
          chunks.push(event.data)
        }

        this.mediaRecorder.onstop = () => {
          const blob = new Blob(chunks, { type: 'audio/wav' })
          this.sampleAudio = URL.createObjectURL(blob)
          const fileName = 'audio-recording.wav';
          this.audioData = new File(chunks, fileName, { type: 'audio/wav' });
        }
      } catch (error) {
        console.error('Recording failed:', error)
      }
    },
    stopRecording() {
      this.isRecording = false
      if (this.mediaRecorder) {
        this.mediaRecorder.stop()
      }
    },
  },
}
</script>

<style>
:root {
  --primary-color: #4caf50;
  --secondary-color: #ff5722;
  --background-color: #f9f9f9;
  --text-color: #333;
  --button-text-color: #fff;
  --button-border-radius: 8px;
}

.upload-speech {
  max-width: 600px;
  margin: 50px auto;
  padding: 20px;
  background: var(--background-color);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 12px;
  text-align: center;
  font-family: Arial, sans-serif;
}

h1 {
  color: var(--primary-color);
  margin-bottom: 10px;
}

p {
  color: var(--text-color);
  font-size: 1rem;
  margin-bottom: 20px;
}

.input-container {
  margin-bottom: 20px;
}

input[type='file'] {
  display: none;
}

.custom-file-upload {
  display: inline-block;
  padding: 10px 20px;
  background-color: var(--primary-color);
  color: var(--button-text-color);
  border-radius: var(--button-border-radius);
  cursor: pointer;
  font-size: 1rem;
  transition: background-color 0.3s;
}

.custom-file-upload:hover {
  background-color: #45a049;
}

.button-container {
  display: flex;
  justify-content: center;
  gap: 15px;
}

button {
  padding: 10px 20px;
  font-size: 1rem;
  color: var(--button-text-color);
  border: none;
  border-radius: var(--button-border-radius);
  cursor: pointer;
  transition:
    background-color 0.3s,
    transform 0.2s;
}

button:disabled {
  cursor: not-allowed;
  opacity: 0.6;
}

.record-button {
  background-color: var(--primary-color);
}

.record-button:hover:not(:disabled) {
  background-color: #45a049;
  transform: scale(1.05);
}

.stop-button {
  background-color: var(--secondary-color);
}

.stop-button:hover:not(:disabled) {
  background-color: #e64a19;
  transform: scale(1.05);
}
.custom-select {
  appearance: none; /* 기본 브라우저 스타일 제거 */
  -webkit-appearance: none; /* 사파리 브라우저 지원 */
  -moz-appearance: none; /* 파이어폭스 브라우저 지원 */
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 16px;
  color: #333;
  padding: 10px 15px;
  width: 60px;
  margin: 10px;
  cursor: pointer;
  outline: none;
  transition: all 0.3s ease;
}

.custom-select:hover {
  background-color: #eaeaea;
  border-color: #bbb;
}

.custom-select:focus {
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

.custom-select option {
  font-size: 16px;
  padding: 10px;
}

</style>
