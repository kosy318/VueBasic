<template>
  <table style="width: 80%; margin-top: 2em; border-collapse: collapse" border="1">
  <thead>
    <tr>
      <th>사원 아이디</th>
      <th>사원명</th>
      <th>부서</th>
      <th>직책</th>
      <th>연봉</th>
    </tr>
  </thead>
  <tbody>
    <tr v-for="emp in resultEmp" :key="emp.id">
      <td>{{emp.id}}</td>
      <td>{{emp.name}}</td>
      <td>{{emp.deptName}}</td>
      <td>{{emp.title}}</td>
      <td>{{emp.salary}}</td>
    </tr>
  </tbody>
</table>
</template>

<script type="module">
import bus from "./EmpBus.vue"
export default {
  data() {
    return {
      emps,
      searchName: '',
    }
  },
  computed: {
    resultEmp() {
      if (this.searchName === '') { // 모든 데이터
        return this.emps;
      } else { // 검색하기
        // console.log(emps.filter((item) => { item.name.indexOf(this.searchName) != -1 }));
        return this.emps.filter((item) => item.name.indexOf(this.searchName) != -1);
      }
    }
  },
  created() {
    bus.$on('search-emp', (name) => {
      this.searchName = name;
    });
  },
}
const emps = [
  {
    id: "1",
    name: "박구곤",
    deptName: "인사부",
    title: "사장",
    salary: "60000",
  },
  {
    id: "18",
    name: "서정주",
    deptName: "기획부",
    title: "사원",
    salary: "13000",
  },
  {
    id: "19",
    name: "안창환",
    deptName: "기획부",
    title: "사원",
    salary: "678",
  },
  {
    id: "20",
    name: "윤정숙",
    deptName: "기획부",
    title: "사원",
    salary: "750",
  },
  {
    id: "21",
    name: "장현철",
    deptName: "기획부",
    title: "사원",
    salary: "8500",
  },
  {
    id: "23",
    name: "강연범",
    deptName: "영업부",
    title: "사원",
    salary: "795",
  },
  {
    id: "24",
    name: "오은경",
    deptName: "기획부",
    title: "사원",
    salary: "860",
  },
  {
    id: "27",
    name: "장길산",
    deptName: "영업부",
    title: "과장",
    salary: "12345",
  },
  {
    id: "28",
    name: "장취산",
    deptName: "영업부",
    title: "사원",
    salary: "23244",
  },
  {
    id: "29",
    name: "김상순",
    deptName: "기획부",
    title: "사원",
    salary: "20000",
  },
  {
    id: "30",
    name: "장삼봉",
    deptName: "인사부",
    title: "사원",
    salary: "10000",
  },
  {
    id: "31",
    name: "백소정",
    deptName: "인사부",
    title: "사원",
    salary: "20000",
  },
  {
    id: "33",
    name: "조현욱",
    deptName: "회계부",
    title: "사원",
    salary: "1500",
  },
];
</script>

<style>

</style>