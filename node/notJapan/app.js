// 1. 필요한 모듈 가져오기
var createError   = require('http-errors');
var express       = require('express');
var path          = require('path');
var cookieParser  = require('cookie-parser');
var logger        = require('morgan');
// 세션모듈 가져오기
var session       = require('express-session');
// 2. 필요한 모듈중에 url을 정의한 모듈 가져오기
var indexRouter   = require('./routes/index');
var usersRouter   = require('./routes/users');

// express 객체 생성
var app           = express();
// 세션 설정 : 시크릿키 지정
app.set('trust proxy', 1) // trust first proxy
// app.use(객체) => req.객체 이렇게 모든 코드에서 접근이 가능하다.
app.use(session({
  secret: 'sadfjdslakjfasdjfiasjfddisafdisanviajvnpvqniopqpneqpwisoxlcn',
  resave: false,
  saveUninitialized: true,
  // cookie: { secure: true }
}))
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// 여기에 정의돈 url들은 세션 없어도 OK
// ~/users/
app.use('/users', usersRouter);

// 이 지점에 세션 체크가 들어간다.
app.use((req, res, next)=>{
  if( typeof req.session.uid === 'undefined' || req.session.uid == null ){
    res.redirect('/users/login')
    return
  }
  // 요청을 넘기는 역할
   next()
})
// 여기부터 나오는 모든 url은 세션이 있어야 접근 가능
// 블루프린트, 업무별로 URL에 prefix부여하여 업부는 나눈다
// ~/
app.use('/', indexRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
