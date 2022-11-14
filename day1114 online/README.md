# 11/14 Vuex

### vuex

- Vue.js application에 대한 상태관리패턴(data) + 라이브러리
- application 모든 component들의 중앙 저장소 역할(데이터 관리)
- 상위(부모) 하위(자식)의 단계가 많이 복잡해 진다면 데이터의 전달하는 부분이 매우 복잡해짐
- application이 여러 구성 요소로 구성되고 더 커지는 경우 데이터를 공유하는 문제가 발생

### vuex로 해결할 수 있는 문제

- MVC 패턴에서 발생하는 구조적 오류
- 컴포넌트 간 데이터 전달 명시
- 여러 개의 컴포넌트에서 같은 데이터를 업데이트 할 때 동기화 문제

### 부모-자식 컴포넌트간의 data 전달

![Untitled](11%2014%20Vuex%201f9eff5ba29a450cbf1b6ad60a4f3c75/Untitled.png)

### 동위 컴포넌트간의 data 전달

![Untitled](11%2014%20Vuex%201f9eff5ba29a450cbf1b6ad60a4f3c75/Untitled%201.png)

### vuex

![Untitled](11%2014%20Vuex%201f9eff5ba29a450cbf1b6ad60a4f3c75/Untitled%202.png)

### 상태관리패턴

- 상태는 앱을 작동하는 원본 소스(=data)
- 뷰는 상태의 선언적 매핑(=template)
- 액션은 뷰에서 사용자 입력에 대해 반응적으로 상태를 바꾸는 방법(=method)

![단방향 데이터 흐름](11%2014%20Vuex%201f9eff5ba29a450cbf1b6ad60a4f3c75/Untitled%203.png)

단방향 데이터 흐름

# vuex의 핵심컨셉

### 이해

컴포넌트 → 비동기 로직 → 동기 로직 → 상태

![Untitled](11%2014%20Vuex%201f9eff5ba29a450cbf1b6ad60a4f3c75/Untitled%204.png)

data - state

computed - getters

methods - actions, mutation

### vuex 기술 요소

- state : 여러 컴포넌트에 공유되는 데이터 data
- getters : 연산된 state값을 접근하는 속성 computed
- mutations : state값을 변경하는 이벤트 로직/메서드 methods
- actions : 비동기 처리 로직을 선언하는 메서드 async methods

### vuex 구성요소

#### state

- vuex는 Single State Tree(단일 상태 트리)를 사용
- 중앙에서 관리하는 모든 상태 정보를 state가 관리(==data)
- 여러 컴포넌트 내부에 있는 특정 state를 중앙에서 관리함
    - vuex이전은 state를 찾기 위해 각 컴포넌트들을 직접 확인
    - vuex를 활용하면 vuex Store에서 컴포넌트에서 사용하는 state를 한 눈에 파악 가능
- mutations에 정의된 method에 의해 변경
- state가 변경되면 해당 state를 공유하는 모든 컴포넌트의 DOM은 자동으로 렌더링 됨
- 모든 Vue 컴포넌트는 Vuex Stroe에서 state 정보를 가져와 사용
- 각 컴포넌트는 dispatch()를 사용하여 actions 내부의 method를 호출

#### actions

- 컴포넌트에서 dispatch() method에 의해 호출됨
- BackEnd API와 통신하여 Data Fetching등의 작업을 수행함 → 동기적 작업 뿐만 아니라 비동기 작업을 포함
- 항상 context가 인자로 넘어옴
    - store.js파일 내에 있는 모든 요소(속성, method)의 변경 및 호출 가능
    - 가능은 하지만 state를 직접 변경하는 것은 권장 x
- mutations에 정의되어 있는 method를 commit method를 이용하여 호출
- state는 반드시 mutations가 가진 method를 통해서만 조작 함
    - 서비스 규모가 커지더라도 state 관리를 올바르게 하기 위함
    

#### mutations

- actions에서 commit() method에 의해 호출됨
- actions에서는 비동기적 작업을 mutations에서는 동기적 작업만을 함
    - 비동기적 작업이 있을 경우 state의 변화 시점이 명확하지 않을 수 있기 때문에
- mutations에 정의하는 method의 첫 번재 인자에는 state가 넘어옴

#### getters

- computed와 유사
- state를 변경하지 않고 활용하여 계산 수행
- getters 자체가 state 자체를 변경하지는 않음

### vuex 단계별 이해하기

- vuex 적용 전 코드 : <a href=”step00”>step00</a>

### vuex 설정

- module 시스템과 함께 사용시 Vue.use()를 통해 Vuex 설정

```jsx
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex); // Vue Instance에 Vuex를 설
```

### 저장소(Store) - state

- vuex 사용 : <a href=”step01”>step01</a>
- 저장소에서 data 속성의 역할
- application에서 공유해야 할 data를 관리
- State에 접근하는 방식: this.$store.state.data_name

![Untitled](11%2014%20Vuex%201f9eff5ba29a450cbf1b6ad60a4f3c75/Untitled%205.png)

### 저장소 - Getters

<a href=”step02”>step02</a>

- component가 vuex의 state를 직접 접근하는 코드가 중복된다면?
- 해결 : Store의 state를 참조하는 Getters(=computed)를 활용
- 정의
    
    ```jsx
    getters: {
    	countMsg(state) {
    		state.count += 1;
    	}
    }
    ```
    
- 사용
    
    ```jsx
    this.$store.getters.countMsg;
    ```
    

![Untitled](11%2014%20Vuex%201f9eff5ba29a450cbf1b6ad60a4f3c75/Untitled%206.png)

### 저장소(Store) - mapGetters

<a href=”step03”>step03</a>

- getters를 조금 더 간단하게 호출
- 주의 : Babel 관련 에러 발생시 해결

### 저장소(Store) - Mutations

<a href=”step04”>step04</a>

<a href=”step05”>step05</a>

- state의 값을 변경하기 위해서 사용
- 각 컴포넌트에서 state의 값을 직접 변경하는 것은 권장하지 않는 방식
- state의 값의 추적을 위해 동기적 기능에 사용
- Mutations는 직접 호출이 불가능하고 store.commit(’정의된 이름’)으로 호출

![Untitled](11%2014%20Vuex%201f9eff5ba29a450cbf1b6ad60a4f3c75/Untitled%207.png)

<aside>
💡 mutation : 대문자
action : camelCase

</aside>

### 저장소(Store) - Actions

<a href=”step06”>step06</a>

<a href=”step07”>step07</a> - mapActions

- 비동기 작업의 결과를 적용하려고 할 때 사용
- Mutations는 상태 관리를 위해 동기적으로 처리하고 비동기적인 처리는 Actions가 담당
- Actions는 비동기 로직의 처리가 종료되면 Mutations를 호출

![Untitled](11%2014%20Vuex%201f9eff5ba29a450cbf1b6ad60a4f3c75/Untitled%208.png)