<template>
  <tr>
    <td>{{ article.articleno }}</td>
    <td>
      <!-- 자바스크립트의 변수로 인식돼야해서 bind 해야함 -->
      <router-link :to="`/board/${article.articleno}`">
        {{ article.subject }}
      </router-link>
    </td>
    <td>{{ article.userid }}</td>
    <td>{{ article.hit }}</td>
    <td>{{ article.regtime }}</td>
  </tr>
</template>

<script>
export default {
  name: "BoardListItem",
  props: {
    article: Object,
  },
};
</script>

<style></style>
