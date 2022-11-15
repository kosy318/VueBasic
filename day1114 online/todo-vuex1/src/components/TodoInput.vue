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
      v-model.trim="content"
      placeholder="입력 후 엔터!"
      v-on:keyup.enter="
        addTodo({ id: 'ssafy', content, sdate: '2022-11-15', edate: '2022-11-15' });
        content = '';
      "
      autofocus
    />
    <div
      class="addbutton"
      v-on:click="
        addTodo({ id: 'ssafy', content, sdate: '2022-11-15', edate: '2022-11-15' });
        content = '';
      "
    >
      추 가
    </div>
  </div>
</template>
<script type="text/javascript">
import Constant from "../util/Constant";
import { mapActions } from "vuex";

export default {
  name: "TodoInput",
  data: function () {
    return { content: "" };
  },
  methods: {
    ...mapActions([Constant.ADD_TODO]),
    // addTodo() {
    //   // actions를 호출해서 서버에 비동기 호출
    //   // mutations를 호출해서 데이터만 추가

    //   this.$store.dispatch(Constant.ADD_TODO, {
    //     id: "ssafy",
    //     content: this.content,
    //     sdate: "2022-11-15",
    //     edate: "2022-11-15",
    //   });
    // },
  },
};
</script>
