<template>
  <tr>
    <td>{{ todo.num }}</td>
    <td>
      <router-link :to="`/todo/${todo.num}`" v-if="isShow"
        ><del>{{ todo.content }}</del></router-link
      >
      <router-link :to="`/todo/${todo.num}`" v-if="!isShow">{{ todo.content }}</router-link>
    </td>
    <td>
      <div class="row">
        <div>{{ todo.sdate }}</div>
        ~
        <div>{{ todo.edate }}</div>
      </div>
    </td>
    <td><input class="form-check-input" name="done" type="checkbox" v-model="isShow" /></td>
  </tr>
</template>

<script>
import http from "@/util/http-commons";

export default {
  name: "TodoListItem",
  props: {
    todo: Object,
  },
  data() {
    return {
      isShow: false,
    };
  },
  created() {
    if (this.todo.done == "Y") this.isShow = true;
  },
  watch: {
    isShow: function (val) {
      let url = "/todo/" + this.todo.num + "/";
      url += val ? "N" : "Y";
      if (val) {
        http.put(url);
      }
    },
  },
};
</script>

<style></style>
