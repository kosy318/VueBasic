<template>
  <div class="pt-5 mt-5 container">
    <h3>할 일 목록</h3>
    <todo-delete-all></todo-delete-all>
    <todo-search @search="searchTodo"></todo-search>
    <table class="table">
      <colgroup>
        <col style="width: 10%" />
        <col style="width: 60%" />
        <col style="width: 20%" />
        <col style="width: 10%" />
      </colgroup>
      <thead>
        <tr>
          <th>번호</th>
          <th>내용</th>
          <th>날짜</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <todo-list-item v-for="todo in todos" :key="todo.num" :todo="todo"></todo-list-item>
      </tbody>
    </table>
  </div>
</template>

<script>
import http from "@/util/http-commons";
import TodoListItem from "@/components/todo/TodoListItem.vue";
import TodoSearch from "@/components/todo/TodoSearch.vue";
import TodoDeleteAll from "@/components/todo/TodoDeleteAll.vue";

export default {
  name: "TodoList",
  components: {
    TodoListItem,
    TodoSearch,
    TodoDeleteAll,
  },
  data() {
    return {
      todos: [],
    };
  },
  created() {
    http.get("/todo").then(({ data }) => (this.todos = data));
  },
  methods: {
    searchTodo(data) {
      console.log(data);
      this.todos = data;
    },
  },
};
</script>

<style></style>
