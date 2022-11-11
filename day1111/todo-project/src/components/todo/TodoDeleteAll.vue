<template>
  <div class="text-right mb-2">
    <a type="button" href="#" class="btn btn-info" role="button" @click="deleteAll">전체 삭제</a>
  </div>
</template>

<script>
import http from "@/util/http-commons";
export default {
  name: "TodoDeleteAll",
  methods: {
    deleteAll() {
      http.delete("/todo").then(() => this.$router.push({ name: "todolist", query: { type: 2 } }));
    },
  },
};
</script>

<style></style>
