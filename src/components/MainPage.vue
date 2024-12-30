<template>
  <div class="main-container">
    <!-- Navbar -->
    <header class="navbar">
      <div class="container">
        <h1 class="logo">SpeechUP</h1>
        <nav>
          <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <router-link to="/speech">Speech</router-link>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <h2>Enhance Your Speech Experience</h2>
        <p>
          Record, analyze, and improve your speech with our AI-powered tools. Perfect for learners, professionals, and anyone looking to communicate better.
        </p>
        <div class="hero-buttons">
          <button class="btn primary-btn">Get Started</button>
        </div>
      </div>
    </section>

    <!-- Features Section -->
    <section class="features">
      <div class="container">
        <h3 class="section-title">Features</h3>
        <div class="feature-cards">
          <div class="feature-card">
            <h4>Speech Analysis</h4>
            <p>AI-powered tools to analyze your speech patterns, tone, and clarity.</p>
          </div>
          <div class="feature-card">
            <h4>Real-time Feedback</h4>
            <p>Get instant feedback on your pronunciation and pacing.</p>
          </div>
          <div class="feature-card">
            <h4>Personalized Reports</h4>
            <p>Receive detailed reports to track your progress over time.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
      <div class="container">
        <p>&copy; 2024 SpeechUP. All rights reserved.</p>
        <div class="footer-links">
          <a href="#">Privacy Policy</a>
          <a href="#">Terms of Service</a>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: "MainPage",
};
</script>

<style>
/* General Styles */
body {
  margin: 0;
  font-family: Arial, sans-serif;
  line-height: 1.6;
  color: #333;
}

/* Main Container */
.main-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

/* Navbar */
.navbar {
  background-color: #fff;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  padding: 1rem 0;
}

.navbar .container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: 1.5rem;
  font-weight: bold;
  color: #4a90e2;
}

.nav-links {
  list-style: none;
  display: flex;
  gap: 1rem;
  margin: 0;
  padding: 0;
}

.nav-links a {
  text-decoration: none;
  color: #333;
  transition: color 0.3s;
}

.nav-links a:hover {
  color: #4a90e2;
}

/* Hero Section */
.hero {
  background: linear-gradient(to right, #eef2f3, #8e9eab);
  color: #333;
  text-align: center;
  padding: 4rem 1rem;
}

.hero-content h2 {
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

.hero-content p {
  font-size: 1.1rem;
  margin-bottom: 2rem;
}

.hero-buttons {
  display: flex;
  justify-content: center;
  gap: 1rem;
}

.btn {
  padding: 0.75rem 1.5rem;
  font-size: 1rem;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.primary-btn {
  background-color: #4a90e2;
  color: #fff;
}

.secondary-btn {
  background-color: #fff;
  color: #4a90e2;
  border: 1px solid #4a90e2;
}

.primary-btn:hover {
  background-color: #357abd;
}

.secondary-btn:hover {
  background-color: #4a90e2;
  color: #fff;
}

/* Features Section */
.features {
  background-color: #f9f9f9;
  padding: 4rem 1rem;
}

.section-title {
  text-align: center;
  font-size: 2rem;
  margin-bottom: 2rem;
}

.feature-cards {
  display: flex;
  justify-content: center;
  gap: 2rem;
  flex-wrap: wrap;
}

.feature-card {
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 5px;
  padding: 1.5rem;
  text-align: center;
  width: 300px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.feature-card h4 {
  color: #4a90e2;
  margin-bottom: 0.5rem;
}

/* Footer */
.footer {
  background-color: #4a90e2;
  color: #fff;
  padding: 1rem 0;
  text-align: center;
}

.footer-links {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin-top: 0.5rem;
}

.footer-links a {
  color: #fff;
  text-decoration: none;
  transition: color 0.3s;
}

.footer-links a:hover {
  color: #ddd;
}
</style>
