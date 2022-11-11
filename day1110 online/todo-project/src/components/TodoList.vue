<template>
  <div>
    <table class="table">
      <thead>
        <tr>
          <th>번호</th>
          <th>내용</th>
          <th>날짜</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(todo, index) in todos" :key="index">
          <td>{{ todo.num }}</td>
          <td>{{ todo.content }}</td>
          <td>{{ todo.sdate }}~{{ todo.edate }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "todoList",
  props: {
    todos: [],
  },
};
</script>

<style></style>
