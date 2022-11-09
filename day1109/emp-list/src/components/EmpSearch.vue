<template>
  <div>
    <br>
    <input type="search" v-model="name" @keyup.enter="search" placeholder="검색어를 입력해주세요.">
    <button @click="search">검색</button>
  </div>
</template>

<script type="module">
import bus from "./EmpBus.vue"
export default {
  data() {
    return {
      name: '',
    }
  },
  methods: {
    search() {
      bus.$emit('search-emp', this.name);
    }
  },
}
</script>

<style>

</style>