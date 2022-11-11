<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="list">TodoList</a>

    <div class="collapse navbar-collapse" id="navb">
      <ul class="navbar-nav mr-auto">
        <!-- <li class="nav-item"><a class="nav-link" href="qna-list">QnA</a></li>
        <li class="nav-item"><a class="nav-link" href="notice-list">공지사항</a></li> -->
      </ul>
      <div class="btn-group">
        <div
          type="button"
          class="btn btn-outline-info"
          @click="$router.push({ name: 'todoinsert' })"
        >
          할 일 추가
        </div>
        <div
          type="button"
          class="btn btn-outline-info"
          @click="$router.push({ name: 'todolist', query: { type: 1 } })"
        >
          목록
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: "TodoHeader",
  watch: {
    $route() {
      this.$router.replace({ query: null });
    },
  },
};
</script>

<style></style>
