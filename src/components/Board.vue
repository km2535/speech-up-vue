<script>



export default {
  name: `Board`,
  data(){
    return {
      posts: [
        { id: 1, title: "첫 번째 글", content: "여기는 첫 번째 게시글입니다.", author: "관리자" },
        { id: 2, title: "두 번째 글", content: "두 번째 게시글의 내용입니다.", author: "회원1" },
      ],
    }
  }
}
</script>

<template>
  <div class="board">
    <h1 class="board-title">게시판</h1>

    <!-- 게시글 목록 -->
    <div class="posts">
      <h2 class="posts-title">게시글 목록</h2>
      <ul class="post-list">
        <li v-for="post in posts" :key="post.id" class="post-item">
          <h3 class="post-title">{{ post.title }}</h3>
          <p class="post-content">{{ post.content }}</p>
          <p class="post-author">작성자: {{ post.author }}</p>
        </li>
      </ul>
    </div>

  </div>
</template>

<style scoped>
/* 일반 스타일 */
.board {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  font-family: Arial, sans-serif;
}

/* 제목 스타일 */
.board-title {
  text-align: center;
  font-size: 2rem;
  margin-bottom: 20px;
  color: #333;
}

/* 게시글 목록 스타일 */
.posts-title {
  font-size: 1.5rem;
  margin-bottom: 10px;
  color: #444;
}

.post-list {
  list-style: none;
  padding: 0;
}

.post-item {
  border: 1px solid #ddd;
  padding: 10px;
  margin-bottom: 10px;
  border-radius: 5px;
  background: #f9f9f9;
}

.post-title {
  font-size: 1.25rem;
  margin-bottom: 5px;
  font-weight: bold;
  color: #333;
}

.post-content {
  margin-bottom: 5px;
  color: #555;
}

.post-author {
  font-size: 0.9rem;
  color: #777;
}

/* 글 쓰기 폼 스타일 */
.write-form {
  margin-top: 20px;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  font-size: 0.9rem;
  margin-bottom: 5px;
  color: #333;
}

input,
textarea {
  width: 100%;
  padding: 10px;
  font-size: 1rem;
  border: 1px solid #ccc;
  border-radius: 5px;
}

textarea {
  resize: none;
  height: 100px;
}

.submit-btn {
  display: block;
  width: 100%;
  padding: 10px;
  font-size: 1rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.submit-btn:hover {
  background-color: #0056b3;
}
</style>
