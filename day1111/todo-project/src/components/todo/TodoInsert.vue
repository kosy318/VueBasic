<template>
  <div class="container pt-5 mt-5">
    <h3>할 일 추가</h3>
    <div>
      <div class="row">
        <div class="form-group text-left col-sm-4">
          <label for="id">아이디:</label>
          <input type="text" class="form-control" name="id" v-model="id" readonly />
          <!-- <input type="text" class="form-control" name="id" value="${ user.id }" readonly /> -->
        </div>
        <div class="form-group text-left col-sm-4">
          <label for="sdate">시작 날짜 : </label>
          <input type="date" class="form-control" name="sdate" v-model="sdate" ref="sdate" />
        </div>
        <div class="form-group text-left col-sm-4">
          <label for="edate">종료 날짜 : </label>
          <input type="date" class="form-control" name="edate" v-model="edate" ref="edate" />
        </div>
      </div>
      <div class="form-group text-left">
        <label for="content">내 용:</label>
        <textarea
          class="form-control"
          rows="2"
          id="content"
          name="content"
          v-model="content"
          ref="content"
        ></textarea>
      </div>
      <button class="btn btn-info" @click="checkValue">Submit</button>
    </div>
    <br />
    <br />
  </div>
</template>

<script>
import http from "@/util/http-commons";

export default {
  name: "TodoInsert",
  data() {
    return {
      id: "kosy",
      sdate: null,
      edate: null,
      content: null,
    };
  },
  created() {
    let today = new Date();

    let year = today.getFullYear();
    let month = today.getMonth() + 1;
    let date = today.getDate();

    this.sdate = this.edate = year + "-" + month + "-" + date;
  },
  methods: {
    checkValue() {
      let err = true;
      let msg = "";
      this.sdate > this.edate &&
        ((msg = "종료 날짜가 시작 날짜보다 작을 수 없습니다."),
        (err = false),
        this.$refs.sdate.focus());
      err &&
        !this.content &&
        ((msg = "내용을 입력해주세요"), (err = false), this.$refs.content.focus());

      if (!err) alert(msg);
      else this.insertTodo();
    },
    insertTodo() {
      let todo = {
        id: this.id,
        sdate: this.sdate,
        edate: this.edate,
        content: this.content,
      };
      http.post("/todo", todo).then(() => {
        this.$router.push({ name: "todolist" });
      });
    },
  },
};
</script>

<style></style>
