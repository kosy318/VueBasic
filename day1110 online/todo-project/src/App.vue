<template>
  <div id="app">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <!-- <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link> -->
      <a class="navbar-brand" href="list">TodoList</a>

      <div class="collapse navbar-collapse" id="navb">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">QnA</li>
          <li class="nav-item">공지사항</li>
        </ul>
        <div id="login" style="display: none">
          <a href="login" class="btn btn-outline-info" role="button">로그인</a>
        </div>

        <div id="logout" style="display: none">
          <span style="color: white"
            >Welcome, <b><span class="user-name"></span>(<span id="user-id"></span>)</b></span
          >&nbsp;&nbsp;&nbsp;
          <a href="logout" class="btn btn-outline-info" role="button">로그아웃</a>
        </div>
      </div>
    </nav>
    <router-view />
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
