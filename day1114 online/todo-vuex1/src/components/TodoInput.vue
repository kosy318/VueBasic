<style>
* {
  box-sizing: border-box;
}
.input {
  border: none;
  width: 75%;
  height: 35px;
  padding: 10px;
  float: left;
  font-size: 16px;
}
.addbutton {
  padding: 10px;
  width: 25%;
  height: 35px;
  background: #d9d9d9;
  color: #555;
  float: left;
  text-align: center;
  font-size: 13px;
  cursor: pointer;
  transition: 0.3s;
}
.addbutton:hover {
  background-color: #bbb;
}
</style>
<template>
  <div>
    <input
      class="input"
      type="text"
      id="task"
      v-model.trim="todo"
      placeholder="입력 후 엔터!"
      v-on:keyup.enter="addTodo"
    />
    <span class="addbutton" v-on:click="addTodo">추 가</span>
  </div>
</template>
<script type="text/javascript">
import Constant from "../util/Constant";

export default {
  name: "TodoInput",
  data: function () {
    return { todo: "" };
  },
  methods: {
    addTodo() {
      // 원래는 actions를 호출해서 서버에 비동기 호출을해야함
      // 지금은 mutations를 호출해서 데이터만 추가

      this.$store.commit(Constant.ADD_TODO, { todo: this.todo });
    },
  },
};
</script>
