<template>
  <div class="form-inline mb-2 float-right">
    <select
      class="form-control"
      name="search"
      id="search"
      v-model="search"
      @change="selectChange()"
    >
      <option value="content">내용</option>
      <option value="date">날짜</option></select
    >&nbsp;&nbsp;
    <input
      id="word"
      class="form-control mr-sm-2"
      type="text"
      name="word"
      v-model="word"
      @keyup.enter="searchTodo"
    />
    <button class="btn btn-info my-2 my-sm-0" @click="searchTodo">검색</button>
  </div>
</template>

<script>
import http from "@/util/http-commons";

export default {
  name: "TodoSearch",
  data() {
    return {
      search: "content",
      word: "",
    };
  },
  methods: {
    selectChange() {
      this.word = "";
      if (this.search === "date") {
        document.querySelector("#word").setAttribute("type", "date");
      } else {
        document.querySelector("#word").setAttribute("type", "text");
      }
    },
    searchTodo() {
      http.get("/todo/" + this.search + "/" + this.word).then(({ data }) => {
        this.word = "";
        this.$emit("search", data);
      });
    },
  },
};
</script>

<style></style>
