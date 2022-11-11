<template>
  <div class="container pt-5 mt-5">
    <h1>todo</h1>

    <br />
    <table class="table table-bordered">
      <TR>
        <TH>DONE</TH>
        <TD>{{ todo.done }}</TD>
        <Th>NAME</Th>
        <TD>{{ todo.id }}</TD>
      </TR>
      <TR>
        <TH>start</TH>
        <TD>{{ todo.sdate }}</TD>
        <TH>end</TH>
        <TD>{{ todo.edate }}</TD>
      </TR>
      <TR>
        <TH>CONTENT</TH>
        <TD COLSPAN="3">{{ todo.content }}</TD>
      </TR>
    </table>
    <div class="btn-group">
      <button
        class="btn btn-info"
        @click="
          $router.push({
            name: 'todomodify',
            params: { num: todo.num, sdate: todo.sdate, edate: todo.edate, content: todo.content },
          })
        "
      >
        수정하기
      </button>
      <button class="btn btn-info" @click="deleteOne">삭제하기</button>
    </div>
    <!-- <router-link to="/todo/list">초기화면</router-link> -->
  </div>
</template>

<script>
import http from "@/util/http-commons";

export default {
  name: "TodoDetail",
  data() {
    return {
      todo: Object,
    };
  },
  created() {
    http.get(`/todo/${this.$route.params.num}`).then(({ data }) => {
      this.todo = data;
    });
  },
  methods: {
    deleteOne() {
      http.delete(`/todo/${this.todo.num}`).then(() => this.$router.push({ name: "todolist" }));
    },
  },
};
</script>

<style></style>
