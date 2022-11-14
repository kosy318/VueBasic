# 11/10 Vue - axios

# axios

### HTTP 통신 : axios

<a href=”01.promise.html”>01.promise.html</a>

<a href=”02.axios.html”>02.axios.html</a>

- Vue에서 권고하는 HTTP 통신 라이브러리는 axios이다.
- Promise 기반이 HTTP 통신 라이브러리이며 상대적으로 다른 HTTP 통신 라이브러리들에 비해 문서화가 잘되어있고 API가 다양하다.
- axios.get(URL) << Promise 객체를 return >> then, catch 사용 가능
- https://github.com/axios/axios

> Promis란 서버에 데이터를 요청하여 받아오는 동작과 같은 비동기 처리에 유용한 자바스크립트 라이브러리이다. 자바스크립트는 단일 스레드로 코드를 처리하기 때문에 특정 로직의 처리가 끝날 때까지 기다려 주지 않는다. 따라서 데이터를 요청하고 받아올 때까지 기다렸다가 화면에 나타내는 로직을 실행해야 할 때 주로 Promise를 활용한다. 그리고 데이터를 받아왔을 때 Promise 데이터를 화면에 표시하거나 연산을 수행하는 등 특정 로직을 수행한다.
> 

### axios API

- axios 대표 API

| API 유형 | 처리 결과 |
| --- | --- |
| axios.get(”URL 주소”).then().catch() | 해당 URL 주소에 대해 HTTP GET 요청을 보냄. 서버에서 보낸 데이터를 정상적으로 받아오면 then() 안에 정의된 로직이 실행되고, 데이터를 받아올 때 오류가 발생하면 catch()에 정의한 로직이 실행 |
| axios.post(”URL 주소”).then().catch() | 해당 URL 주소에 대해 HTTP POST 요청을 보냄. then()과 catch()는 get 방식과 동일 |
| axios({옵션 속성}) | HTTP요청에 대한 자세한 속성들을 직접 정의하여 보낼 수 있다. 데이터 요청을 보낼 URL, HTTP 요청방식, 보내는 데이터 유형 등 |
- axios(config)

<a href=”02.axios.html”>02.axios.html</a>

<a href=”03.sync&await.html”>03.sync&await.html</a>

<a href=”03.sync&await2.html”>03.sync&await2.html</a>

```jsx
// POST request
axios({
	method: "post",
	url: "/user",
	data: {
		name: "홍길동",
		userId: "ssafy"
	}
});
```

```jsx
// GET request
axios({
	method: "get",
	url: "/user/ssafy"
	responseTyppe: "json"
})
.then(function (response) {
	// logic
});
```

# Vue-router

### vue-router

- 라우팅: 웹 페이지 간의 이동 방법
- Vue.js의 공식 라우터
- 라우터는 컴포넌트와 매핑
- Vue를 이용한 SPA를 제작할 때 유용
- URL에 따라 컴포넌트를 연결하고 설정된 컴포넌트를 보여준다.

[https://v3.router.vuejs.org/kr](https://v3.router.vuejs.org/kr)

### vue-router 연결

- ‘routes’옵션과 함께 router instance 생성

<a href=”index.html”>router01/index.html</a>

```jsx
// 라우트 컴ㅍ포넌트
const Main = {
  template: "<div>메인 페이지</div>",
};
const Board = {
  template: "<div>자유 게시판</div>",
};

// 라우터 객체 생성
const router = new VueRouter({
  mode: "history",
  routes: [
    {
      path: "/",
      component: Main,
    },
    {
      path: "/board",
      component: Board,
    },
  ],
});
```

### vue-router 이동 및 렌더링

- 네비게이션을 위해 router-link 컴포넌트를 사용
- 속성은 ‘to’ prop을 사용
- 기본적으로 <router-link>는 ‘<a>’ 태그로 렌더링

```jsx
<router-link to="/">HOME</router-link>
<router-link to="/board">게시판</router-link>
```

- 현재 라우트에 맞는 컴포넌트가 렌더링된다.

```jsx
<!-- 현재 라우트에 맞는 컴포넌트가 렌더링 -->
<router-view></router-view>
```

<a href=”router02”>router02</a>

### $router, $route

<a href=”router03”>router03</a>

- 라우터 설정
    - :no 동적라우트
    - $route.params.no로 :no 접근
    - 물음표 뒤에 붙은건 parmas 대신 query로 접근
- 전체는 router, 내가 보고있는 페이지는 route

```
const router = new VueRouter({
  routes: [
    ...
      path: '/board/:no',
      component: BoardView,
    },
    ...
  ],
});
```

- 라우터 링크

```jsx
<router-link to="/board/30">30번 게시글</router-link>
```

- 전체 라우터 정보

```jsx
this.$router
```

- 현재 호출된 해당 라우터 정보

```jsx
this.$router
this.$route.params.no
this.$route.path
```

### 이름을 가지는 라우트

<a href=”router04”>router04</a>

- 라우트는 연결하거나 탐색을 수행할 때 이름이 있는 라우트를 사용
- Router Instance를 생성하는 동안 routes 옵션에 지정
- to에 v-bind를 해줌

```jsx
<router-link :to="{name: 'main'}">HOME</router-link>
```

### 프로그래밍 방식 라우터

- <route-link>를 사용하여 선언적 네비게이션용 anchor 태그를 만드는 것 외에도 라우터의 instance method를 사용하여 프로그래밍으로 수행

```jsx
$router.push('home') == $router.push({path: 'home'})
$router.push({name: 'boardview', params: {no: 3}}) // /boardview/:no
$router.push({name: '/board', query: {pg: 1}}) // /board?pg=1
```