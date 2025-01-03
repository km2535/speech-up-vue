<template>
  <div class="form-container">
    <!-- 입력 박스 -->
    <div class="input-group">
      <input
        type="text"
        v-model="inputText"
        placeholder="Type something..."
        class="input-box"
      />
    </div>

    <!-- 버튼 -->
    <button @click="submitText" class="submit-btn">Submit</button>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'BoardInput',
  props: {
    posts: Array,
  },
  data() {
    return {
      inputText: '',
      redisContent:[],
    };
  },
  methods: {
    async submitText() {
      const data = (await axios.get('http://localhost:3000/word-board')).data?.data;
      const inputData = this.inputText.trim();
      this.redisContent = data;
      this.redisContent.push(inputData);
      if (inputData) {
        await axios.post('http://localhost:3000/word-board',{
          "redisContent": this.redisContent
        })
        this.$emit('update-posts', inputData);

        this.inputText = '';
      } else {
        alert('Please enter some text!');
      }
    },
  },
};
</script>

<style scoped>
.form-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 20px;
}

/* 입력 박스 스타일 */
.input-group {
  margin-bottom: 20px;  /* 버튼과의 간격 */
}

.input-box {
  width: 300px;
  padding: 10px;
  font-size: 16px;
  border: 2px solid #007bff;  /* 테두리 색상 */
  border-radius: 8px;
  outline: none;
  transition: all 0.3s ease;  /* 효과를 부드럽게 만들기 */
}

.input-box:focus {
  border-color: #0056b3;  /* 포커스 시 색상 변경 */
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);  /* 포커스 시 그림자 효과 */
}

/* 버튼 스타일 */
.submit-btn {
  width: 150px;
  padding: 12px;
  font-size: 16px;
  color: white;
  background-color: #007bff;  /* 버튼 배경색 */
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.submit-btn:hover {
  background-color: #0056b3;  /* 버튼 호버 시 색상 변경 */
}

.submit-btn:active {
  transform: scale(0.98);  /* 버튼 클릭 시 살짝 눌린 효과 */
}

/* 반응형 디자인 */
@media (max-width: 600px) {
  .input-box {
    width: 80%;
  }

  .submit-btn {
    width: 80%;
  }
}
</style>
