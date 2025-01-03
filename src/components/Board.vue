<script>
import axios from "axios";
import Typed from "typed.js";
import BoardInput from '@/components/BoardInput.vue'

export default {
  name: "BoardWord",
  components: { BoardInput },
  data() {
    return {
      posts: [],
      typed: null,  // Typed.js 인스턴스를 관리할 변수
    };
  },
  methods: {
    async getBoard() {
      let config = {
        method: "get",
        url: `${import.meta.env.VITE_API_HOST}/word-board`,  // API 호출 URL
      };
      const response = await axios.request(config);
      this.posts = response.data.data.map((post) => ({
        content: post,
      }));

      this.startTypingAnimation();
    },
    updatePosts(newPost) {
      this.posts.push({ content: newPost });
      this.startTypingAnimation(); // 새로 추가된 글에 대해 애니메이션 재시작
    },
    startTypingAnimation() {
      if (this.typed) {
        this.typed.destroy(); // 기존 인스턴스를 파괴
      }

      const options = {
        strings: this.posts.map(post => post.content),
        typeSpeed: 70,  // 글자 타이핑 속도 (느리게)
        backSpeed: 40,  // 지우는 속도
        backDelay: 1000,  // 타이핑이 끝난 후 대기 시간
        loop: true,

      };

      this.typed = new Typed(this.$refs.typedElement, options);
    },
  },
  created() {
    this.getBoard();
  },
  beforeUnmount() {
    if (this.typed) {
      this.typed.destroy();
    }
  },
};
</script>

<template>
  <div class="board">
    <div class="posts">
      <span ref="typedElement"></span>
    </div>
  </div>
  <BoardInput :posts="posts" @update-posts="updatePosts" />
</template>

<style scoped>
.board {
  font-family: 'Roboto', sans-serif;
  padding: 40px 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 70vh;
  color: #333;
  text-align: center;
}

.posts span {
  font-size: 30px; /* 글자 크기 */
  font-weight: bold; /* 볼드체 */
  letter-spacing: 2px; /* 글자 간격을 조금 띄워줍니다 */
  word-wrap: break-word; /* 긴 글을 자동으로 줄 바꿈 */
  min-width: 300px;
  line-height: 1.5;
}

</style>
