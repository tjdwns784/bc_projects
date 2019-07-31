pragma solidity ^0.5.7;

// 매핑 : 자바(Map), 파이썬(딕셔너리), JS(객체)
// 키 : 값
// 키 : 모든 자료형이 올 수 있다.
// public getter 함수를 자동으로 만들어준다.
contract BasicMapping
{
    // state variable
    mapping(address => uint) public balance;
    function setBalance( uint value ) public
    {
        // 이 컨트렉트를 구동한자에게 금액을 세팅
        balance[ msg.sender ] = value;
    }
}
contract MappingUse
{
    BasicMapping bm = new BasicMapping();
    function test( uint value ) public returns (uint)
    {
        bm.setBalance(value);
        // getter 함수는 get변수명(키) 가 아니라, 변수명(키) 이런식으로 구성
        // 매핑 관련 작업, transaction에 적용되므로, 채굴을 통해 트렌젝션 처리가 된다.
        // 따라서, 값을 세팅해도, 처리 전이므로 리턴 값이 0이다
        return bm.balance( msg.sender );
    }
}