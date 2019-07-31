pragma solidity ^0.5.7;
//함수
/* 
 - 구조
function 함수명 ( 타입 x1, 타입x2, ...) options returns( 타입 x1, 타입x2, ...)
{
  //statement;,,,
  return(...) //<-생략가능
}
- options
1)가시성     : (access modifier)  
  - external : 컨트렉트상 명시된 것만 외부에 공개
  - public : 모든 컨트렉트의 내부 외부에 공개
  - internal : 해당 컨트렉트와 상속 컨트렉트에만 공개
  - private :  오직, 해당 컨트렉트만 공개
2)비용측면 : 
  - constant(x) (더이상 사용되지 않는다 정의) -> 이렇게 정의된 함수는 gas를 소모하지 않는다
  - view : 다음 행위를 함수 내부에서 하지 않겠다 <- 아래코드를 해야하면 view 사용 불가
   1) 상태 변수 값 변경
   2) 이벤트 발생(이벤트 -> 컨트렉트 -> nodejs쪽으로 이벤트 전달)
   3) 다른 컨트렉트 생성
   4) 이더 전송(송금)
   5) view나 pure로 선언되지 않은 함수 호출
  - pure : 다음 행위를 함수 내부에서 하지 않겠다 <- 아래코드를 해야하면 pure 사용 불가
               1) 상태 변수를 읽는다
               2) xx.balance 잔액확인등 접근시도
               3) 컨트렉트의 사전에 이미 정의된 전역객체들 block, tx, msg등을 접근행위
               4) pure로 정의되어 있지 않는 함수를 호출
  - payable : 비용이 발생된다. 돈이 움직이다
   ex) 컨트렉트가 멤버함수를 통해서 다른 지갑(타인), 이더를 송금하거나 받는 등 
   -> 함수 자체가 지불가능한 형태가 되는 경우 사용

*/
contract BasicFunc
{
    int age = 1;
    //gas가 발생되지 않는 상황에서 상태변수를 읽는다 => view ok
    function t() public view returns (int)
    {
        return age;
    }
    //상태 변수를 수정함으로 view사용 불가
     function t2() public returns (int)
    {
       age++;
       return age;
    }
    //상태변수를 사용 안햇다. 지불 관련 내용 없다
    function t3() public  pure returns(int)
    {
        //뭔가 많은 일을 했다..
        return 10;
    }
    //t4함수를 구현하는데 부호없는정수 2개를 입력받아서 더한값을 리턴하는 함수를 구현하시오
    function t4(uint a, uint b) public pure returns(uint)
    {
       uint result = a+b;
       return result;
    }
    //리턴값이 없으면 returns 생략
    function a() external pure
    {
        //external : 외부에서만 사용 가능
    }
     function b() private pure
    {
        //external : 외부에서만 사용 가능
    }
    
    //리턴할 변수를 returns에서 미리 지정하면 변수 선언 및 return도 생략 가능
    function t5(uint x, uint y) public pure returns(uint result)
    {
        //pure 함수 내부에서는 pure함수만 호출할 수 있다
        //t(), t2() <- error
        t3();
        //error
        //a();
        b();
        result = x+y;
    }
    // 구현절차
    /*
    - 1. 기능을 우선 구현 ( ~public returns(생략가능))
    - 2. 함수의 비용적인 측면 고려하여, view, pure, payable 사용
    - 3. 가시성에 대한 검토 후 최적의 가시성 구성
    */
}