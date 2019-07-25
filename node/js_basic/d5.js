// 모듈화 => 누구나 사용할 수 있다
var mysql      = require('mysql');

exports.selectLogin = ( uid, upw, cb) => {
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'mysql',
        database: 'node'
    });
    connection.connect((err)=>{
        if( err ){
        } else{
            let sql = `SELECT * FROM users WHERE uid=? AND upw=?;`
            connection.query(sql, [uid, upw],(err, rows)=>{
                cb(err, rows)
                connection.end();
            })
        }
    });
}
