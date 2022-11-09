<template>
  <div class="container">
    <h2>사용자 목록</h2>
    <b-table hover :items="result" selectable select-mode="single" @row-selected="selectOne">
    </b-table>
  </div>
</template>

<script>
export default {
  name: "CustomerList", // component 이름
  props: {
    result: [],
  },
  methods: {
    selectOne(items) {
      if (items.length != 0) this.$emit("select-one", { num: items[0].num });
      else this.$emit("select-one", { num: "" });
    },
  },
};
</script>

<style></style>
