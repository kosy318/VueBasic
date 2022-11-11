<template>
  <div class="p-5">
    <div class="text-right mb-2">
      <div class="btn-group">
        <a type="button" href="insert" class="btn btn-info" role="button">할 일 추가</a>
        <a type="button" href="deleteAll" class="btn btn-info" role="button">전체 삭제</a>
      </div>
    </div>
    <div class="form-inline mb-2 float-right">
      <select class="form-control" name="search" id="search" onchange="selectChange()">
        <option value="content" selected="selected">내용</option>
        <option value="date">날짜</option></select
      >&nbsp;&nbsp; <input id="word" class="form-control mr-sm-2" type="text" name="word" />
      <button class="btn btn-info my-2 my-sm-0" onclick="searchTodo()">검색</button>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style></style>
