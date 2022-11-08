# Vue Instance 속성 - method, filter, computed, watch

### Vue method

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test17.html">test17.html</a>

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test18.html">test18.html</a>

- Vue Instance는 생성과 관련된 data 및 method의 정의 가능
- method 안에서 data를 “this.데이터이름”으로 접근 가능

### Vue filter

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test19.html">test19.html</a>

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test20.html">test20.html</a>

- 뷰의 필터는 화면에 표시되는 텍스트의 형식을 쉽게 변환해주는 기능
- filter를 이용하여 표현식에 새로운 결과 형식을 적용
- 중괄호 보간법 [ {{ }} ] 또는 v-bind 속성에서 사용이 가능
- 전역필터 vs 지역필터

```html
<!-- 중괄호 보간법 -->
{{ 데이터 | 필터 | ... | ... }}
```

### Vue computed 속성

#### Vue computed vs method 차이점

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test21_1.html">test21_1.html</a>

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test21.html">test21.html</a>

- 특정 데이터의 변경사항을 실시간으로 처리
- 캐싱을 이용하여 데이터의 변경이 없을 경우 캐싱된 데이터를 반환 >> 값
- Setter과 Getter를 직접 지정할 수 있음
- 작성은 method 형태로 작성하지만 Vue에서 proxy 처리하여 property처럼 사용

### Vue watch 속성

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test23.html">test23.html</a>

- Vue Instance의 특정 property가 변경될 때 실행할 콜백 함수 설정

### Vue watch

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test24.html">test24.html</a>

- Computed는 종속된 data가 변경되었을 경우 그 data를 다시 계산하여 캐싱한다.
- Watch의 경우는 data가 변경되었을 경우 다른 data를 (변경하는) 작업을 한다.

|  | computed | watch |
| --- | --- | --- |
| 기능 | vue 객체안의 data를 사용해 작업 후 리턴 | vue 객체의 data를 메소드 이름으로 정해 작업(다른 변수에 세팅 가능) |
| param | () | (newValue, oldValue) |
| 특징 | cache 기능<br>비교적 <b>간단한</b> 계산 등 | 시간이 <b>오래 걸리는</b> 작업<br><br>서버에 요청</b>해 값을 받아옴 |
| 모양 | 메소드 | 메소 |

# Vue Event

### Vue event

- DOM Event를 청취하기 위해 v-on directive 사용
- inline event handling
- method를 이용한 event handling

#### v-on

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test25.html">test25.html</a>

- v-on directive를 사용하여 DOM 이벤트를 듣고 트리거 될 때 JavaScript를 실행할 수 있다.

### method event handler

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test26.html">test26.html</a>

- 이벤트 발생시 처리 로직을 v-on에 넣기 힘들다. 이 때문에 v-on에서는 이벤트 발생시 처리해야하는 method의 이름을 받아 처리.

### inline method handler

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test27.html">test27.html</a>

- 메소드 이름을 직접 바인딩 하는 대신 인라인 JavaScript 구문에 메소드를 사용할 수도 있다.
- 원본 DOM 이벤트에 액세스 해야 하는 경우 특별한 $event 변수를 사용해 메소드에 전달할 수도 있다.

### 이벤트 수식어(Event Modifier)

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test28.html">test28.html</a>

- test27.html에서의 event.preventDefault()와 같이 method내에서 작업을 할 수도 있지만 method는 DOM의 이벤트를 처리하는 것보다 data 처리를 위한 로직만 작업하는 것이 좋다.
- 이 문제를 해결하기 위해, Vue는 v-on 이벤트에 이벤트 수식어를 제공한다.
- 수식어는 점으로 표시된 접미사이다.

### 키 수식어(Key Modifier)

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test29.html">test29.html</a>

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test30.html">test30.html</a>

- Vue는 키 이벤트를 수신할 때 v-on에 대한 키 수식어를 추가할 수 있다.
- key code
    - .enter(.13)
    - .tab
    - .delete(”Delete”와 “Backspace” 키 모두를 캡처합니다.)
    - .esc
    - .space
    - .up
    - .down
    - .left
    - .right

### ref, $refs

- 뷰에서는 $refs 속성을 이용해 DOM에 접근할 수 있다.
- 단, 뷰의 가장 중요한 목적 중 하나는 개발자가 DOM을 다루지 않게 하는 것이므로, 되도록 ref를 사용하는 것을 피하는 것이 좋다.

# CSS class binding

### class binding

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test31.html">test31.html</a>’

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test32.html">test32.html</a>

- element의 class와 style을 변경
- v-bind:class는 조건에 따라 class를 적용할 수 있다.

# form input binding

### 폼 입력 바인딩(Form Input Bindings)

- v-model directive를 사용하여 폼 input과 textarea element에 양방향 데이터 바인딩을 생성할 수 있다.
    - text와 textarea 태그는 value 속성과 input이벤트를 사용한다.
    - 체크박스들과 라디오버튼들은 checked 속성과 change 이벤트를 사용한다.
    - Select 태그는 value를 prop으로, change를 이벤트로 사용한다.

### form - text, textarea

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test33.html">test33.html</a>

- 문자열(text)

```html
<input v-model="message" placeholder="여기를 수정해보세요">
<p>메시지: {{ message }}</p>
```

- 여러줄을 가진 문장(textarea)
    - 텍스트 영역의 보간(<textarea>{{ text }}</textarea>)은 작동하지 않는다. >> v-model를 사용

```html
<span>여러 줄을 가지는 메시지: </span>
<p style="white-space: pre-line">{{ message }}</p>
<br>
<textarea v-model="message" placeholder="여러줄을 입력해보세요"></textarea>
```

### form - checkbox

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test34.html">test34.html</a>

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test35.html">test35.html</a>

- 여러 개의 체크박스는 같은 배열을 바인딩 할 수 있다.
- 배열의 값과 checkbox의 vlaue 속성이 같을 경우 체크 처리됨

### form - radio

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test36.html">test36.html</a>

- radio의 경우 선택된 항목의 value 속성의 값을 관리

### form - select

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test37.html">test37.html</a>

multiple : <a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/vueinstance/test38.html">test38.html</a>

- select box일 경우 선택된 항목의 value 속성의 값을 관리
- 'v-model' 표현식의 초기 값이 어떤 옵션에도 없으면, '\<select\>'element는 "선택없음"상태로 렌더링된다
- v-for를 이용한 동적 option 렌더링


# Component

### 컴포넌트(Component)

![Untitled](11%2007%20Vue%20js%20a04b60458de34431af6751d8b4959079/Untitled.png)

- Vue의 가장 강력한 기능 중 하나
- HTML Element를 확장하여 재사용 가능한 코드를 캡슐화
- Vue Component는 Vue Instance이기도 하기때문에 모든 옵션 객체를 사용
- Life Cycle Hook 사용 가능
- 전역 컴포넌트와 지역 컴포넌트

### 전역 컴포넌트 등록

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test01.html">test01.html</a>

- 전역 컴포넌트를 등록하려면, Vue.component(tagName, options)를 사용.
- 권장하는 컴포넌트 이름: 케밥 표기법(전부 소문자, -)

### 지역 컴포넌트 등록

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test02.html">test02.html</a>

- 컴포넌트를 components 인스턴스 옵션으로 등록함으로써 다른 인스턴스/컴포넌트의 범위에서만 사용할 수 있는 컴포넌터를 만들 수 있다.

```jsx
var Child = {
	template: '<div>사용자 정의 컴포넌트 입니다!</div>'
}

new Vue({
	// ...
	components: {
		// <my-component>는 상위 템플릿에서만 사용할 수 있습니다.
		'my-component': Child
	}
})
```

### Component Template

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test03.html">test03.html</a>

![Untitled](11%2007%20Vue%20js%20a04b60458de34431af6751d8b4959079/Untitled%201.png)

### Component data 공유

#### 문제

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test04.html">test04.html</a>

reference를 가지고 다녀서 한꺼번에 바뀐다.

![Untitled](11%2007%20Vue%20js%20a04b60458de34431af6751d8b4959079/Untitled%202.png)

#### 해결

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test05.html">test05.html</a>

![Untitled](11%2007%20Vue%20js%20a04b60458de34431af6751d8b4959079/Untitled%203.png)

# Component간 통신

### 컴포넌트간 통신 → 단방

- 상위(부모) - 하위(자식) 컴포넌트 간의 data 전달 방법
- 부모에서 자식: props라는 특별한 속성을 전달(Pass Props)
- 자식에서 부모: event로만 전달 가능(Emit Event)

![Untitled](11%2007%20Vue%20js%20a04b60458de34431af6751d8b4959079/Untitled%204.png)

### 상위에서 하위 컴포넌트로 data 전달

- 하위 컴포넌트는 상위 컴포넌트의 값을 직접 참조 불가능
- data와 마찬가지로 props 속성의 값을 template에서 사용이 가능

### props

```jsx
Vue.component('child', }
	// props 정의
	props: ['message'],
	// 데이터와 마찬가지로 prop은 템플릿 내부에서 사용할 수 있으며
	// vm의 this.message로 사용할 수 있습니다.
	template: '<span>{{ message }}</span>'
})
```

```jsx
<child message="안녕하세요!"></child>
```

### literal props

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test06.html">test06.html</a>

![Untitled](11%2007%20Vue%20js%20a04b60458de34431af6751d8b4959079/Untitled%205.png)

### 렌더링 과정

1. new Vue()로 상위 컴포넌트인 인스턴스를 하나 생성
2. Vue.component()를 이용하여 하위 컴포넌트인 child-component를 생성
3. <div id=”app”>내부에 <child-component>가 있기 때문에 하위 컴포넌터가 된다. 처음 생성한 인스턴스 객체가 #app의 요소를 가지기 때문에 부모와 자식 관계가 성립한다.
4. 하위 컴포넌터에 props 속성을 정의한다.[’propsdata’]
5. html에 컴포넌트 태그(child-component)를 추가한다.
6. 하위 컴포넌트에 v-bind 속성을 사용하면 상위 컴포넌트의 data의 key에 접근이 가능하다.(message)
7. 상위 컴포넌트의 message 속성 값인 String 값이 하위 컴포넌트의 propsdata로 전달된다.
8. 하위 컴포넌트의 template 속성에 정의된 ‘<span>{{ propsdata }}</span>에게 전달된다.

### 동적 props

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test07-1.html">test07-1.html</a>

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test07-2.html">test07-2.html</a>

- v-bind를 사용하여 부모의 데이터에 props를 동적으로 바인딩 할 수 있다.
- 데이터가 상위에서 업데이트 될 때마다 하위 데이터로도 전달된다.

```jsx
<div>
	<input v-model="parenting">
	<br>
	<child v-bind:my-message="parentMsg"></child>
</div>
```

- v-bind에 대한 단축 구문을 사용하는 것이 더 간단하다.

```jsx
<child :my-message="parentMsg"></child>
```

### 객체 속성(properties) 전달 props

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test08.html">test08.html</a>

- 오브젝트의 모든 속성을 전달할 경우, v-bind:prop-name 대신 v-bind만 작성함으로써 모든 속성을 prop으로 전달할 수 있다.

```jsx
post: {
	id: 1,
	title: 'My Journey with Vue'
}
```

```jsx
<blog-post v-bind="post"></blog-post>
```

- 위 코드는 아래와 같이 동작

```jsx
<blog-post
	v-bind:id="post.id"
	v-bind:title="post.title"></blog-post>
```

### 사용자 정의 이벤트(Custom Events)

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test09.html">test09.html</a>

<a href="https://github.com/kosy318/VueBasic/blob/main/day1107%20online/1107_%EB%B0%B0%ED%8F%AC/component/test10.html">test10.html</a>

- 이벤트 이름
    - 컴포넌트 및 props와는 달리, 이벤트는 자동 대소문자 변환을 제공하지 않는다.
    - 대소문자를 혼용하는 대신에 emit할 정확한 이벤트 이름을 작성하는 것을 권장
    - v-on 이벤트 리스너는 항상 자동으로 소문자 변환이 되기 때문에  v-on:myEvent는 자동으로 v-on:myevent로 변환된다. 이름이 my-event일 경우 myEvent 이벤트를 들을 수 없다.
    - 이러한 이유 때문에, 이벤트 이름에는 kebab-case를 사용하는 것이 권장됨.

![Untitled](11%2007%20Vue%20js%20a04b60458de34431af6751d8b4959079/Untitled%206.png)
