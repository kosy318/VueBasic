<template>
  <div class="home">
    <!-- <img alt="Vue logo" src="../assets/logo.png" /> -->
    <todo-header></todo-header>
    <todo-input></todo-input>
  </div>
</template>

<script>
// @ is an alias to /src
// import axios from "axios";
import TodoHeader from "@/components/TodoHeader.vue";
import TodoInput from "@/components/TodoInput.vue";

export default {
  name: "HomeView",
  components: {
    TodoHeader,
    TodoInput,
  },
  data() {
    return {
      todos: [],
    };
  },
};
</script>
