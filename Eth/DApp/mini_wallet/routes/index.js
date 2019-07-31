var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// 실시간 소켓을 이용한 사설네트워크와 연동 처리
router.get('/eth', function(req, res, next) {
  res.render('eth');
});

module.exports = router;
