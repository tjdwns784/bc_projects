/*
 $ mkdir scraping
 $ cd scraping
 $ npm init -y
  -> package.json 생성
  -> cheerio 모듈은 html을 DOM으로 올려서 css selector를 통해 데이터를 추출하는 모듈
  -> cheerio 모듈은 html에서 데이터를 추출하는 모듈 -> 데이터 구축 : 추출=>디비에 적재
 $ npm i --save cheerio
 $ npm i --save request
 $ npm i --save mysql
*/

const request   = require('request')
const cheerio   = require('cheerio')
let target_site = 'https://nonojapan.com/'
var mysql       = require('mysql');

request( target_site, (err, response, body)=>{
  if(!err){
    let $ = cheerio.load( body )
    // 데이터를 담는 그릇
    let back_data = []
    // 데이터 덩어리를 구해서 순환 처리(한개씩 꺼내서 처리)  
    $('.mdl-cell.mdl-card.mdl-shadow--4dp.portfolio-card').each((index, ele)=>{
      // 카테고리
      let cate    = $(this).find('.pink-text>span').text()      
      // 제품명
      let name    = $(this).find('.mdl-card__title-text').text()      
      // 대체상품
      let chgName = $(this).find('button').text()      
      // 해시코드
      let hash    = $(this).find('.blue-grey-text').text()      
      // 데이터 추가: 배열에 데이터1개당 객체구조로, [ {},{},{}, ... ]
      back_data.push({
        cate:cate,
        name:name,
        chgName:chgName.split(' ').join('|'),
        hash:hash.split(' ').join('|'),
      })
    })  
    // 최종 데이터 확인
    console.log( back_data )
    // 디비 저장
    saveDB( back_data )
  }
} )
function saveDB( back_data )
{
  var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'mysql',
    database : 'nodedb'
  });
  connection.connect( (err)=>{  
    if( err ){  
      console.log( '디비 접속 오류', err )
    }else{          
      for( sql of back_data){
        // 데이터 추가
        connection.query('INSERT INTO NoSell SET ?', sql, function (error, results, fields) {
          console.log( sql, error )          
        });
      }            
    }  
  } );
}

