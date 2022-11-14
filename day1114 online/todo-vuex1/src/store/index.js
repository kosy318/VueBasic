import Vue from "vue";
import Vuex from "vuex";
import Constant from "@/util/Constant";
import http from "@/util/http-commons";

// 모든 컴포넌트에서 this.$store라는 값으로 store에 접근 가능
Vue.use(Vuex);

const store = new Vuex.Store({
  // data
  state: {
    todolist: [],
  },
  actions: {
    [Constant.ALL_TODO]: ({ commit }) => {
      http.get("/todo").then((response) => {
        commit(Constant.ALL_TODO, { todolist: response.data });
        console.log(response.data);
      });
    },
  }, // 비동기 호출
  mutations: {
    // 실제로 데이터에 접근해 수정할 수 있음
    addTodo: (state, payload) => {
      state.todolist.push({ id: new Date().getTime(), todo: payload.todo, done: false });
    },
    [Constant.ALL_TODO]: (state, payload) => {
      state.todolist = payload.todolist;
    },
  },
});
export default store;
