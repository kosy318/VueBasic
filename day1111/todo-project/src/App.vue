<template>
  <div id="app">
    <the-header></the-header>
    <router-view :key="$route.fullPath"></router-view>
    <!-- key="$route.path" : 같은 경로일때 로드가 되지 않는 문제
    절대 경로로 확인되는 경로를 다시 연결하여 노출시키는 방법 -->
    <the-footer></the-footer>
  </div>
</template>

<script>
import TheHeader from "@/components/TheHeader";
import TheFooter from "@/components/TheFooter";

export default {
  components: {
    TheHeader,
    TheFooter,
  },
};
</script>

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
