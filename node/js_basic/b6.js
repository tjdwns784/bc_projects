// 모듈 가져오기 : 자바로 비유 => import
// 모듈을 가져와서 사용하는 코드
// b6가 b6_mod 안에 있는 변수, 함수, 객체 등등 사용하겠다 => 모듈가져오기
// 모듈가져오기 : require('모둘명')
// 1. require('써드파트모듈명')
let exp = require('mysql')
// npm init -y => package.json 생성
// npm i --save mysql

// 2. require('상대경로법표현한 내가만든모듈명')
let mod = require('./b6_mod')
console.log( 'mod:', mod )
console.log( 'mod:', mod.pi2 )
console.log( 'mod:', mod.sub() )

// 3. require('./폴더명')
// 무조건 ./폴더명/index.js를 가져온다.