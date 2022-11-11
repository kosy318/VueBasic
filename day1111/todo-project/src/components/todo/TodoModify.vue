<template>
  <div class="container pt-5 mt-5">
    <h3>수정하기</h3>
    <div>
      <div class="row">
        <div class="form-group text-left col-sm-6">
          <label for="sdate">시작 날짜 : </label>
          <input type="date" class="form-control" name="sdate" v-model="todo.sdate" />
        </div>
        <div class="form-group text-left col-sm-6">
          <label for="edate">종료 날짜 : </label>
          <input type="date" class="form-control" name="edate" v-model="todo.edate" />
        </div>
      </div>
      <div class="form-group text-left">
        <label for="content">내 용</label>
        <textarea
          class="form-control"
          rows="2"
          id="content"
          name="content"
          v-model="todo.content"
        ></textarea>
      </div>

      <button class="btn btn-primary" @click="modify">Submit</button>
    </div>
    <a href="list">전체화면</a>
  </div>
</template>

<script>
import http from "@/util/http-commons";

export default {
  name: "TodoModify",
  data() {
    return {
      todo: {},
    };
  },
  created() {
    this.todo = this.$route.params;
  },
  methods: {
    modify() {
      http.put("/todo", this.todo).then(() => this.$router.push({ name: "todolist" }));
    },
  },
};
</script>

<style></style>
