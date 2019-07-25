/*
 $ mkdir scraping
 $ cd scraping
 $ npm init -y
  -> package.json 생성
  -> cheerio 모듈은 html을 DOM으로 올려서 css selector를 통해 데이터를 추출하는 모듈
  -> cheerio 모듈은 html에서 데이터를 추출하는 모듈 -> 데이터 구축 : 추출=>디비에 적재
 $ npm i --save cheerio
 $ npm i --save request
*/
const request   = require('request')
const cheerio   = require('cheerio')
let target_site = 'https://nonojapan.com/'

// 접속
request( target_site, (err, response, body)=>{
  if(!err){
    // 사이트가 응답하는 순수 html 텍스트를 획득 -> body
    console.log( typeof body )
    // 1. body의 내용을 DOM으로 생성한다->형식은 jQuery방식
    let $ = cheerio.load( body )
    console.log( typeof $ )
    // 2. 추출 -> css selector를 통해서 대상을 특정하고, 추출한다
    // 2-1. 카테고리만 뽑아보자 : 특정할 내용은, class가 mdl-navigation__link인 요소
    //      요소(Element):시작태그 + 콘텐츠 + 종료태그 => <a>하이</a>
    //      class의 css selector는 .class값
    //console.log( $('.mdl-navigation__link') )
    console.log( $('.mdl-navigation__link')['1'] )
    //      id => #, 요소명:문서상에 존재하는 모든 요소명,     
    
    // 상품 목록 특정: mdl-cell mdl-card mdl-shadow--4dp portfolio-card
    let data = $('.mdl-cell.mdl-card.mdl-shadow--4dp.portfolio-card').text()
    console.log( data)
    
  }
} )