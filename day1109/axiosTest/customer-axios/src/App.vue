<!-- 서버와 비동기 통신 하는 곳 -->
<template>
  <div id="app">
    <customer-header></customer-header>
    <customer-upper
      :selected="selected"
      @select-all="selectAll"
      @customer-insert="customerInsert"
      @customer-update="customerUpdate"
      @customer-delete="customerDelete"
      @customer-search="customerSearch"
    ></customer-upper>
    <customer-list :result="result" @select-one="selectOne"></customer-list>
  </div>
</template>

<script>
import CustomerHeader from "./components/CustomerHeader.vue";
import CustomerUpper from "./components/CustomerUpper.vue";
import CustomerList from "./components/CustomerList.vue";
import axios from "axios"; // 비동기 통신

export default {
  name: "App",
  components: {
    CustomerHeader,
    CustomerUpper,
    CustomerList,
  },
  data() {
    return {
      result: [], // selectAll한 결과.  CustomerList에게 전달해줘야함
      selected: {},
    };
  },
  created() {
    this.selectAll();
  },
  methods: {
    selectAll() {
      axios
        .get("http://localhost/customers")
        .then((response) => {
          this.result = response.data; // 서버에서 받아온 데이터는 .data로 가져와야한다.
        })
        .catch((response) => (this.errored = response.status));
    },
    selectOne(res) {
      axios.get("http://localhost/customers/" + res.num).then((response) => {
        if (res.num == "") {
          this.selected.num = "";
        } else {
          this.selected = response.data;
        }
      });
    },
    customerInsert(res) {
      axios
        .post("http://localhost/customers", {
          num: res.num,
          name: res.name,
          address: res.address,
        })
        .then(() => {
          this.selectAll();
        });
    },
    customerUpdate(res) {
      axios
        .put("http://localhost/customers", {
          num: res.num,
          address: res.address,
        })
        .then(() => {
          this.selectAll();
        });
    },
    customerDelete(res) {
      axios.delete("http://localhost/customers/" + res.num).then(() => {
        this.selectAll();
      });
    },
    customerSearch(res) {
      axios.get("http://localhost/customers/find/" + res.address).then((response) => {
        this.result = response.data;
      });
    },
  },
};
</script>

<style CustomerList>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
