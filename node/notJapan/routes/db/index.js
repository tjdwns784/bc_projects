// 모듈화 => 누구나 사용할 수 있다
// npm i --save mysql를 반드시 수행할것
var mysql      = require('mysql');

exports.selectLogin = ( uid, upw, cb ) => {

    // 개발 디비
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'mysql',
        database: 'nodedb'
    });
    //   상용 디비
    // var connection = mysql.createConnection({
    //         host: 'node-db.cdc6x5sujlta.ap-northeast-2.rds.amazonaws.com',
    //         user: 'prince',
    //         password: 'june1386',
    //         database: 'nodedb'
    //     });
    connection.connect((err)=>{
        if( err ){
            console.log( '메롱 접속 오류랑께', err)
        } else{
            let sql = `SELECT * FROM users WHERE uid=? AND upw=?;`
            connection.query(sql, [uid, upw],(err, rows)=>{
                cb(err, rows)
                connection.end();
            })
        }
    });
}

// 불매 상품 목록 이름 순으로 전부 다 가져오는 함수
exports.selectNoSellData = ( cb ) => {

    // 개발 디비
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'mysql',
        database: 'nodedb'
    });
    connection.connect((err)=>{
        if( err ){
            // console.log( '메롱 접속 오류랑께', err)
            cb(err, [])
        } else{
            let sql = `SELECT * FROM nosell ORDER BY name ASC;`
            connection.query(sql, (err, rows)=>{
                cb(err, rows)
                connection.end();
            })
        }
    });
}


// 검색어를 포함한 데이터를 획득하는 쿼리 수행 후 결과를 돌려주는 함수
// cb : 콜백함수 -> JS상 비동기 프로그램에서 결과를 돌려줄 때 함수를 인자로 받는다.
// keyword : 검색어
exports.selectItemsByKeyword = ( keyword, cb ) => {
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'mysql',
        database: 'nodedb'
    });
   
    connection.connect((err)=>{
        if( err ){
            cb(err,[])
        } else{
            // ? : '값'을 의미
            // sql 완성에 반드시 파라미터를 전달해서 완성할 필요 없다.
            // 문자열을 완성시키는것만으로도 동일한 결과를 낸다.
            let sql = `SELECT * FROM nosell
            WHERE NAME LIKE '%${keyword}%' OR
            chgName LIKE '%${keyword}%' OR 
            HASH LIKE '%${keyword}%'
            ORDER BY name ASC;`
            connection.query(sql, (err, rows)=>{
                cb(err, rows)
                connection.end();
            })
        }
    });
}

exports.selectItemsByNo = ( no, cb ) => {
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'mysql',
        database: 'nodedb'
    });
   
    connection.connect((err)=>{
        if( err ){
            cb(err,[])
        } else{
            let sql = `SELECT * FROM nosell WHERE NO =?;`
            connection.query(sql,no, (err, rows)=>{
                cb(err, rows)
                connection.end();
            })
        }
    });
}