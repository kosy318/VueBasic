<style>
* {
  box-sizing: border-box;
}
ul {
  margin: 0;
  padding: 0;
}
ul li {
  cursor: pointer;
  position: relative;
  padding: 8px 8px 8px 40px;
  background: #eee;
  font-size: 14px;
  transition: 0.2s;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
ul li:hover {
  background: #ddd;
}
ul li.checked {
  background: #bbb;
  color: #fff;
  text-decoration: line-through;
}
ul li.checked::before {
  content: "";
  position: absolute;
  border-color: #fff;
  border-style: solid;
  border-width: 0px 1px 1px 0px;
  top: 10px;
  left: 16px;
  transform: rotate(45deg);
  height: 8px;
  width: 8px;
}
.close {
  position: absolute;
  right: 0;
  top: 0;
  padding: 8px 12px 8px 12px;
}
.close:hover {
  background-color: #f44336;
  color: white;
}
</style>
<template>
  <ul id="todolist">
    <li v-for="a in getTodoList" :key="a.num" :class="{ checked: a.done == 'Y' }">
      <!-- click.stop 해당하는 이벤트만 하고 안전하게 끝나게 하는 것 -->
      <!-- event.target.tagName : 태그 이름
          this.tagName : 버블링된 태그 이름 
          상위 태그까지 이벤트가 올라갈 수 있다-->
      <span v-if="a.done == 'Y'" @click.stop="doneToggle({ num: a.num, done: a.done })"> ★ </span>
      <span v-else @click.stop="doneToggle({ num: a.num, done: a.done })"> ☆ </span>
      <span>{{ a.content }}</span>
      <span v-if="a.done == 'Y'"> ✅</span>
      <span class="close" @click.stop="deleteTodo({ num: a.num })">&#x00D7;</span>
    </li>
  </ul>
</template>
<script type="text/javascript">
// import { mapState } from "vuex";
import { mapActions, mapGetters } from "vuex";
import Constant from "../util/Constant";

export default {
  name: "TodoList",
  created() {
    // 서버로부터 데이터 받아오기
    this.$store.dispatch(Constant.ALL_TODO); // action call
  },
  // mapGetters로 대체
  computed: { ...mapGetters(["getTodoList"]) },
  // data에 관심이 있어서 State!!
  // store안의 state 값 중에서 'todolist'에 관심이 있음
  // computed: mapState(["todolist"]),
  //   computed: {
  //     todolist() {
  //       return this.$store.state.todolist;
  //     },
  //   },
  methods: {
    checked() {},
    // 완료로 바꿔주는 것
    // doneToggle() {},

    // x 버튼 누르면 삭제
    // deleteTodo() {this.$store.dispatch(Constant.DELETE_TODO);},
    // store 안 actions에 관심이 있음
    // ... 은 spread 연산자 : store안 actions에 delete_todo 함수가 이 자리에 그대로 오는 것
    ...mapActions([Constant.DELETE_TODO, Constant.DONE_TOGGLE]),
  },
};
</script>
