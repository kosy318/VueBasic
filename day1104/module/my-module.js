function cube(x) {
    return x * x * x;
}

function hello(str) {
    return `hello, ${str}`;
}

let user = {
    num: 123,
    name: "박지현",
    address: "회기",
};

const foo = Math.PI * 2;

// 이 파일에 있는 내용을 외부에서 사용이 가능하도록
// named export
export { cube, hello, user, foo };

// anonymous export - 1번만 허용됨
export default {
    id: "ssafy",
    name: "이다운",
};
