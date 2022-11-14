<style>
* {
  box-sizing: border-box;
}
.header {
  background-color: purple;
  padding: 30px 30px;
  color: yellow;
  text-align: center;
}
.header:after {
  content: "";
  display: table;
  clear: both;
}
</style>
<template>
  <div id="todolistapp">
    <div id="header" class="header">
      <h2>Todo List App</h2>
      <TodoInput />
    </div>
    <TodoList></TodoList>
  </div>
</template>
<script type="text/javascript">
import TodoInput from "./TodoInput";
import TodoList from "./TodoList";

export default {
  name: "todo-list",
  components: { TodoInput, TodoList },
};
</script>
