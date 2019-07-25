var express = require('express');
var router = express.Router();
let db = require('./db');

/* GET home page. */
//요청이 들어오면 해석을 하는데
//만약, get방식이고, 주소가 /이면 아래 함수가  호출된다 => 라우팅
router.get('/', function (req, res, next) {
  //세션이 없으면 /users/login 으로 이동
  if( typeof req.session.uid === 'undefined' || req.session.uid == null ){
    res.redirect('/users/login')
    return
  }
  //views/index.ejs 파일을 읽어서 전달한 데이터를 사용해서 완성된 html을 응답한다 =>렌더링한다
  //렌더링의 대상 ejs파일은 무조건 views 밑에서 찾는다
  res.render('index', { title: '왕자님의 놀이터에 오신걸 환영합니다.' , name:req.session.name });
});

//~/search
router.get('/search', (req, res, next) => {
  // 1.사이트가 요청이 들어오면, nosell 테이블에서 이름순으로 전체 데이터를 가져온다 -> sql
  db.selectNoSellData((err, rows) => {
    //console.log(rows)
    // 2.데이터를 렌더링할때 전달한다
    res.render('search', { rows: rows });
    // 3.search.ejs 내부에서 데이터를 반복해서 추출하여 화면을 구성한다
    // 4. 만약, 카테고리가 금융이면 박스의 배경색을 bg.yellow로 처리한다.

  });
});
// ~/search , post방식
router.get('/search2', (req, res, next) => {
  // 2-1. 검색어 추출 => get방식으로 전달된 데이터 추출
  let keyword = req.query.keyword;
  console.log(keyword)
  // 3. 디비 쿼리 수행, 검색어 넣어서 수행하는 쿼리 결과 => json으로 응답
  // 함수명: selectItemsByKeyword()
  db.selectItemsByKeyword(keyword, (err, rows) => {
    // 3-1.  => json으로 응답.
    res.json(rows);
  });
});

// 동적 파라미터는 url에 데이터를 넣어서 전송하는 방식 -> url은 무한대로 확장이 가능하다.
// get방식, post방식등 method 방식과 혼용해서 사용 가능
// ~/url/:변수명
router.get('/info/:no', (req, res, next) => {
  // ur 값을 기준으로 존재하지 않으면 미리보기 화면, 값이 존재하면 수정화면으로 설정하겠다.
  console.log( req.query.u, typeof req.query.u === 'undefined')
  // 구현순서
  // 1. selectItemByNo() 구현
  // 2. 1번 함수 결과 가져와서 판단
  db.selectItemsByNo(req.params.no, (err, rows) => {
    if ( rows.length > 0) {
      // 4. rows 데이터가 존재하면 처리 res.render() 위치시킴
      res.render('info', { row: rows[0], update:typeof req.query.u != 'undefined'})
    } else {
      // 3. rows 데이터가 없다면 처리 res.render() 위치시킴
      res.end('no item')
    }
  })
  // 5. info_sub.ejs에 데이터 출력 부분 확인 및 화면 최종 확인
  // res.end('info page'+req.params.no)
  // no을 넣어서 해당 상품 정보를 가져와서 화면에 뿌린다(render).
  // 함수명:selectItemByNo

})
module.exports = router;