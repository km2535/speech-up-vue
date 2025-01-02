<script >
  export default {
    name: "HeaderNav",
  };
</script>

<template>
  <!-- Navbar -->
  <header class="navbar">
    <div class="container">
      <h1 class="logo">SpeechUP</h1>
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
