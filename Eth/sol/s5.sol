pragma solidity ^0.5.7;

// 조건문 반복문 제어문 등
// 기본 문법은 기존 언어(자바, 자바스크립트 등) 별반 다르지 않다.
// if, for , while, do-while, break, continue
// 삼항 연산자
contract BasicIfForWhileTest
{
    function getCoffeePrice (uint price) public pure returns (int)
    {
        // 입력값이 1500이상이면 1을 리턴
        // 1500보다 작으면 -1 리턴
        // 1500과 같으면 0리턴
        if(price > 1500){
          return 1;  
        } else if(price == 1500){
            return 0;
        } else
            return -1;
    }
    // 삼항 연산자 => 상황이 2개, 값을 리턴 혹은 세팅 포인트
    function threeCheck ( uint x ) public pure returns (uint result)
    {
        result = x>10 ? 1 : 0;
    }
    // for
    function forCheck ( uint value) public pure returns (uint)
    {
        uint sum = 0;
        // 1부터 해당(인자)값까지의 누적합(총합)
        // value에 5을 넣으면, 1+2+3+4+5 => 15
        // 이런 부분 구현하이소
        for(uint i=1; i<=value; i++) {
            // sum = sum + 1;
            sum += i;
        }
        return sum;
    }
    function forCheck2 ( uint value) public pure returns (uint, uint)
    {
        
        //forCheck2를 구현, 누적합, 누적곱을 구해서 리턴
        //value에 5를 넣으면, 1+2+3+4+5 = >15
        //value에 5를 넣으면, 1*2*3*4*5 = >120
        uint sum = 0;
        uint mul = 1;
        for(uint i=1; i<=value; i++) {
            sum += i;
            mul *= i;
        }
        return (sum, mul);
    }
        //while
    function whileCheck(uint value) public pure returns(uint,uint)
    {
        uint n = 0;
        uint n2 = 0;
        uint i = 0;
        //0~무한대
        while( i<value){
            n += 1;
            if( i>10){
                break;
            }
            i++;
        }
        //1~무한대
        i=0;
        do{
            i++;
            if( i%2 == 0)
            {
                continue;
            }
            if( i>10){
                break;
            }
            n2 += 1;
        }while(i<value);
        return (n, n2);
    }
}
