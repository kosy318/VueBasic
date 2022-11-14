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
    [Constant.ADD_TODO]: ({ commit }, todo) => {
      http.post("/todo", todo).then((response) => {
        commit(Constant.ADD_TODO, { todo, num: response.data });
      });
    },
    [Constant.ALL_TODO]: ({ commit }) => {
      http.get("/todo").then((response) => {
        commit(Constant.ALL_TODO, { todolist: response.data });
      });
    },
    [Constant.DELETE_TODO]: ({ dispatch }, todo) => {
      http.delete("/todo/" + todo.num).then(() => {
        dispatch(Constant.ALL_TODO);
      });
    },
    [Constant.DONE_TOGGLE]: ({ commit }, todo) => {
      console.log(todo);
      http.put("/todo/" + todo.num + "/" + todo.done).then(() => {
        commit(Constant.DONE_TOGGLE, { num: todo.num });
      });
    },
  }, // 비동기 호출
  mutations: {
    // 실제로 데이터에 접근해 수정할 수 있음
    addTodo: (state, payload) => {
      state.todolist.push({ num: payload.num, content: payload.todo.content, done: false });
    },
    [Constant.ALL_TODO]: (state, payload) => {
      state.todolist = payload.todolist;
    },
    [Constant.DONE_TOGGLE]: (state, payload) => {
      state.todolist.forEach((todo) => {
        if (todo.num == payload.num) {
          if (todo.done == "N") todo.done = "Y";
          else todo.done = "N";
        }
      });
    },
  },
});
export default store;
