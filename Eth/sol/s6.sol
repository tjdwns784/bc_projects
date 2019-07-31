pragma solidity ^0.5.7;

// 형변환
contract BasicTypeCasting
{
    // 타입의 형변환
    // 1. 암묵적 형변환 : 작은 타입 => 큰타입, uint8 -> uint256
    // 2. 명시적 형변환 : 큰타입 => 작은 타입, uint 256 -> uint8(데이터를 자르고, 자료형을 고정)
    function asTest() public pure returns (uint256, int8)
    {
        // uint8:0~2의 8승 -1
        uint8 a   = 1; // 0~255 ok 256 error 
        uint256 b = 1;
        // 암묵적 형변환
        uint256 c = a;
        // 명시적 형변환
        int8 d = int8(b); // (int8)b; <- java
        return(c, d);
    }

}