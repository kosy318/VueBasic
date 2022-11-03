# Vue.js

Vue→CSR→SPA

초기 로딩이 느림

### Vue.js

- Evan You에 의해서 만들어짐.
- Vue 탄생은 Google에서 Angular로 개발하다가 가벼운 걸 만들어 보고 싶은 생각으로 시작한 개인 프로젝트
- 사용자 인터페이스를 만들기 위해 사용하는 오픈 소스 Progressive Framework

### Vue.js 특징

- Approachable(접근성)
- Versatile(유연성)
- Performant(고성능)

### MVVM Pattern

- Model + View + ViewModel
- Model : 순수 자바 스트립트 객체(JSON, DATA)
- View : 웹페이지의 DOM
- ViewModel : Vue의 역할
    - 기존에는 자바스크립트로 view에 해당하는 DOM에 접근하거나 수정하기 위해 jQuery와 같은 library 이용. Vue는 view와 Model을 연결하고 자동으로 바인딩하므로 양방향 통신을 가능하게 함. 중간에서 다리 역할.
- view와 model 사이에 연관이 없다

### Vue.js Installation

- Direct <script> include
    - download
    - CDN: <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
- npm
- CLI

### Vue Instance 생성

![Untitled](11%2003%20Vue%20js%2014f2841f2aa642618ca248c572418323/Untitled.png)

| 속성 | 설명 |
| --- | --- |
| el | Vue가 적용될 요소 지정. CSS Selector or HTML Element. 어떤 DOM을 관리할거냐. View |
| data | Vue에서 사용되는 정보 저장. 객체 또는 함수의 형태. method |
| template | 화면에 표시할 HTML, CSS등의 마크업 요소를 정의하는 속성. 뷰의 데이터 및 기타 속성들도 함께 화면에 그릴 수 있다. |
| methods | 화면 로직 제어와 관계된 method를 정의하는 속성. 마우스 클릭 이벤트 처리와 같이 화의 전반적인 이벤트와 화면 동작과 관련된 로직을 추가 |
| created | 뷰 인스턴스가 생성되자 마자 실행할 로직을 정의 |

### Vue Instance의 유효 범위

- Vue Instance를 생성하면 HTML의 특점 범위 안에서만 옵션 속성들이 적용
- el 속성과 밀접한 관계가 있다.

<br>

- Vue()로 인스턴스가 생성됨
- el 속성에 지정한 화면 요소(돔)에 인스턴스가 부착됨
- el 속성에 인스턴스가 부착된 후 data 속성이 el 속성에 지정한 화면 요소와 그 이하 레벨의 화면 요소에 적용되어 값이 치환

# Vue Instance Life-Cycle

### Vue Instance Lify Cycle

![[https://v2.vuejs.org/v2/guide/instance.html#Lifecycle-Diagram](https://v2.vuejs.org/v2/guide/instance.html#Lifecycle-Diagram)](11%2003%20Vue%20js%2014f2841f2aa642618ca248c572418323/Untitled%201.png)

[https://v2.vuejs.org/v2/guide/instance.html#Lifecycle-Diagram](https://v2.vuejs.org/v2/guide/instance.html#Lifecycle-Diagram)

(CSR)SPA → 속도, 초기 로딩 속도는 떨어지지만 화면 전환 속도는 빠르다

- Life Cycle은 크게 나누면 Instance의 생성, 생성된 Instance를 화면에 부착, 화면에 부착된 Instance의 내용이 갱신, Instance가 제거되는 소멸의 4단계로 나뉜다.

| life cycle 속성 | 설명 |
| --- | --- |
| beforeCreate | Vue Instance가 생성되고 각 정보의 설정 전에 호출. DOM과 같은 화면 요소에 접근 불가 |
| created | Vue Instance가 생성된 후 데이터들의 설정이 완료된 후 호출. Instance가 화면에 부착하기 전이기 때문에 template 속성에 정의된 DOM 요소는 접근 불가. 서버에 데이터를 요청(http 통신)하여 받아오는 로직을 수행하기 좋다. |
| beforeMount | 마운트가 시작되기 전에 호출 |
| mounted | 지정된 element에 Vue Instance 데이터가 마운트 된 후에 호출. template 속성에 정의한 화면 요소에 접근할 수 있어 화면 요소를 제어하는 로직 수행 |
| beforeUpdate | 데이터가 변경될 때 virtual DOM이 렌더링, 패치 되기 전에 호출 |
| updated | Vue에서 관리되는 데이터가 변경되어 DOM이 업데이트 된 상태. 데이터 변경 후 화면 요소 제어와 관련된 로직을 추가. |
| beforeDestroy | Vue Instance가 제거되기 전에 호출 |
| destroyed | Vue Instance가 제거된 후에 호출 |

# template - 보간법 interpolation

### 보간법(Interpolation)

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test04.html">test04.html</a>

#### 문자열

- 데이터 바인딩의 가장 기본 형태는 “Mustache” 구문(이중 중괄호)을 사용한 텍스트 보간
    - {{ 속성명 }}
- v-once 디렉티브를 사용하여 데이터 변경 시 업데이트 되지 않는 일회성 보간을 수행
    - v-once
    - v- → directive

```html
<span>메시지 : {{ msg }}</span>

<span v-once>다시는 변경하지 않습니다 : {{ msg }}</span>
```

### 원시 HTML

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test05.html">test05.html</a>

- 이중 중괄호(mustaches)는 HTML이 아닌 일반 텍스트로 데이터를 해석
- 실제 HTML을 출력하려면 v-html 디렉티브를 사용

```html
<p>Using mustaches: {{ rawHTML }}</p>

<p>Using g-html directive: <span v-html="rawHtml"></span></p>
```

### JavaScript 표현식 사용

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test06.html">test06.html</a>

- Vue.js는 모든 데이터 바인딩 내에서 JavaScript 표현식의 모든 기능을 지원

```html
{{ number + 1 }}
{{ ok? 'YES' : 'NO' }}
{{ message.split('').reverse().join('') }}
<div v-bind:id="'list-' + id"></div>
```

- 한가지 제한사항은 각 바인딩에 하나의 단일 표현식만 포함될 수 있다.

```html
<!-- 아래는 구문입니다. 표현식이 아닙니다 -->
{{ var a = 1 }}

<!-- 조건문은 작동하지 않습니다. 삼항 연산자를 사용해야 합니다 -->
{{ if (ok) {return message} }}
```

# template -Directive

### 디렉티브

- 디렉티브는 v- 접두사가 있는 특수 속성
- 디렉티브 속성 값은 단일 JavaScript 표현식이 된다.(v-for 제외)
- 디렉티브의 역할은 표현식의 값이 변경될 때 사이드 이펙트를 반응적으로 DOM에 적용

![Untitled](11%2003%20Vue%20js%2014f2841f2aa642618ca248c572418323/Untitled%202.png)

#### v-model⭐⭐⭐

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test07.html">test07.html</a>

- 양방향 바인딩 처리를 위해 사용(form의 input, textarea)

#### v-bind

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test08.html">test08.html</a>

- 엘리먼트의 속성과 바인딩 처리를 위해서 사용
- v-bind는 약어로 “:”로 사용 가능

#### v-show

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test09.html">test09.html</a>

- 조건에 따라 엘리먼트를 화면에 출력
- style의 display를 변경

#### v-if, v-else-if, v-else

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test10.html">test10.html</a>

- 조건에 따라 엘리먼트를 화면에 렌더링

#### v-show vs v-if의 차이점

|  | v-if | v-show |
| --- | --- | --- |
| 렌더링 | false일 경우 x | 항상 o |
| false일 경우 | 엘리먼트 삭제 | display:none 적용 |
| template 지원 | O | X |
| v-else 지원 | O | X |

#### v-for

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test12.html">test12.html</a>

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test13.html">test13.html</a>

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test14.html">test14.html</a>

- 배열이나 객체의 반복에 사용
- v-for=”요소변수이름 in 배열” v-for=”(요소변수이름, 인덱스) in 배열”

#### template

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test15.html">test15.html</a>

- 여러 개의 태그들을 묶어서 처리해야 할 경우 template을 사용
- v-if, v-for, component등과 함께 많이 사용

#### v-cloak

<a href="https://github.com/kosy318/VueBasic/blob/main/day1103%20online/1103_%EB%B0%B0%ED%8F%AC/test16.html">test16.html</a>

- Vue Instance가 준비될 때까지 mustache 바인딩을 숨기는 데 사용
- [v-cloak]{display: none}과 같은 CSS 규칙과 함께 사용
- Vue Instance가 준비되면 v-cloak은 제거됨
