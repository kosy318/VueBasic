<template>
  <h3>{{ msg }}</h3>
</template>

<script>
export default {
  props: {
    msg: String,
  },
};
</script>

<!-- scoped: 이 뷰에만 적용 -->
<style scoped>
h3 {
  color: red;
}
</style>
