<template>
  <div class="container">
    <form id="form1" class="form-horizontal">
      <div class="w-50 m-auto">
        <b-input-group class="mb-2">
          <template #prepend>
            <b-input-group-text>번호:</b-input-group-text>
          </template>
          <b-form-input id="num" type="text" v-model="num"></b-form-input>
        </b-input-group>
        <b-input-group class="mb-2">
          <template #prepend>
            <b-input-group-text>이름:</b-input-group-text>
          </template>
          <b-form-input id="name" type="text" v-model="name"></b-form-input>
        </b-input-group>
        <b-input-group class="mb-2">
          <template #prepend>
            <b-input-group-text>주소:</b-input-group-text>
          </template>
          <b-form-input id="address" type="text" v-model="address"></b-form-input>
        </b-input-group>
      </div>

      <b-button-group>
        <b-button type="button" variant="info" id="btnInsert" @click="customerInsert"
          >등록</b-button
        >
        <b-button type="button" variant="info" id="btnUpdate" @click="customerUpdate"
          >수정</b-button
        >
        <b-button type="button" variant="info" id="btnDelete" @click="customerDelete"
          >삭제</b-button
        >
        <b-button type="button" variant="info" id="btnSearch" @click="customerSearch"
          >검색</b-button
        >
        <b-button variant="info" id="btnAll" @click="selectAll">전체</b-button>
        <b-button variant="info" id="btnInit" @click="init">초기화</b-button>
      </b-button-group>
    </form>
    <hr />
    <div class="w-50 m-auto">
      <b-list-group horizontal v-show="selected.num" class="w-100 m-3">
        <b-list-group-item>{{ selected.num }}</b-list-group-item>
        <b-list-group-item>{{ selected.name }}</b-list-group-item>
        <b-list-group-item>{{ selected.address }}</b-list-group-item>
      </b-list-group>
    </div>
  </div>
</template>

<script>
export default {
  name: "CustomerUpper",
  props: {
    selected: {},
  },
  data() {
    return {
      num: "",
      name: "",
      address: "",
    };
  },
  methods: {
    selectAll() {
      this.$emit("select-all");
    },
    init() {
      this.num = "";
      this.name = "";
      this.address = "";
    },
    customerInsert() {
      this.$emit("customer-insert", { num: this.num, name: this.name, address: this.address }); // 부모(App.vue)에게 신호를 줘서 서버와 비동기 작업 하도록 함
      this.init();
    },
    customerUpdate() {
      this.$emit("customer-update", { num: this.num, address: this.address });
      this.init();
    },
    customerDelete() {
      this.$emit("customer-delete", { num: this.num });
      this.init();
    },
    customerSearch() {
      this.$emit("customer-search", { address: this.address });
      this.init();
    },
  },
};
</script>

<style></style>
