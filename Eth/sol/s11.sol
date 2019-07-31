pragma solidity ^0.5.7;

// 상속
// - 컨트렉트 상속, 부모의 맴버들을 그대로 사용 가능
// - 자식은 재정의, 맴버 추가 가능
// - 인터페이스, 추상컨트렉트
contract A
{
    function f() public pure returns(uint)
    {
        return 10;
    }
}
contract B
{
    function f() public pure returns(uint)
    {
        return 20;
    }
    function f2() public pure returns(uint)
    {
        return 30;
    }
}

// C는 A를 상속받고 B를 상속 받았다.
// C의 함수들은 어떤것?
// 상속받은 함수들이 동일하면, 나중에 상속받은 함수가 최종
contract C is A, B {}
contract D is B, A {}
// 재정의
contract E is B, A 
{
    // override
       function f() public pure returns(uint)
    {
        return 100;
    }
}
// 추상 컨트렉트
// 함수가 선언만 되어 있다.
// 스스로 생성 불가, 상속받아서 구현하는 구조
// 틀형태로 제공
contract Form
{
    function eat( string memory food ) public pure returns( bool ); 
}
contract F is Form {
    // 컴파일 단계에서는 오류가 없으나, 배포 단계에서 에러가 난다 (구현하지않으면)
    function eat( string memory food ) public pure returns( bool )
    {
        return true;
    }
}
    // 인터페이스
    // 순수한 틀
interface Form2
{
    // 인터페이스의 함수는 external, 인자값은 calldata 추가    
   function eat( string calldata food ) external pure returns( bool );
}
    // 인터페이스 구현시 앞에 클래스와 동일한 함수가 겹치면 오류 발생
contract G is Form2 {
    function eat( string memory food ) public pure returns( bool )
    {
        return true;
    }
}