<script >
  export default {
    name: "HeaderNav",
  };
</script>

<template>
  <header class="navbar">
    <div class="container">
      <h1 class="logo"><router-link to="/">SpeechUp</router-link></h1>
      <nav>
        <ul class="nav-links">
          <li><router-link to="/">Home</router-link></li>
          <li><router-link to="/speech">Speech</router-link></li>
          <li><router-link to="/board">Board</router-link></li>
        </ul>
      </nav>
    </div>
  </header>
</template>

<style scoped>

</style>
