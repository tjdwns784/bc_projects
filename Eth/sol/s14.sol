pragma solidity ^0.5.7;

// 라이브러리
// 특정 기능을 가진 함수들을 라이브러리라는 형태로 구성하여
// 네트워크 상에 배포를 하면 여러개의 컨트렉트들이 해당 라이브러리를
// 가져다가 사용할 수 있다.
library math{
    function addInt ( int a, int b ) public pure returns (int c)
    {
        return a+b;
    }
}
contract A
{
    function test ( int a, int b ) public returns (int)
    {
        return math.addInt( a, b );
    }
    
}
