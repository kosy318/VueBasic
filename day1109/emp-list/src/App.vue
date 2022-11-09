<template>
  <div id="app">
    <my-header></my-header>
    <my-search></my-search>
    <my-list></my-list>
  </div>
</template>

<script type="module">
import MyHeader from "./components/EmpHeader.vue";
import MySearch from "./components/EmpSearch.vue";
import MyList from "./components/EmpList.vue";

export default {
  name: 'App',
  components: {
    MyHeader,
    MySearch,
    MyList
  }
}
</script>

<style>
* {
  margin: 0 auto;
}

#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

body {
  text-align: center;
  background-color: #f6f6f8;
}

input {
  border-style: groove;
  width: 200px;
}

button {
  border-style: groove;
}

.shadow {
  box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.03);
}
</style>
