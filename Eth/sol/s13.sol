pragma solidity ^0.5.7;

//  storage, memory, stack
/*
 - storage : 컨트렉트의 상태를 정의, sendTransaction으로 통해 상태 변경가능
 - memory : 함수 호출시 내부에만 존재하는 임시변수, storage보다 저렴
                 컨트렉트 레벨에서 사용 불가
 - stack : 개수가 제한적인 비용이 거의 들지 않는 영역
--------------------------------------------------------------------------------------
 - storage : 구조체, 배열, 매핑 등 선언하고 좋다.(디펄트로 storage에 저장) 상태변수
 - memory : 함수 인자, 함수 리턴값
 - stack : 언급되지 않는 케이스는 스택에 저장
*/
contract VarTest
{
    uint[20] public x;
    // test1 : f() call => 0(OK) or 3(X)
    // f2()의 인자는 memory 였다
    // f2()를 호출할때, 상태변수를 넣으면, 주소값이 전달되는것이 아니라,
    // 사본이 전달된다. 따라서 아무리 수정을 해도, 사본이 수정되는 것이므로,
    // 원본(상태변수) 유지된다.
    function f() public returns (uint)
    {
      f2(x);
      return x[2];
    }
    // test2 : fEx() call => 0(X) or 4(OK)
    // fEx()의 인자는 storage이다. 따라서 상태변수를 인자로 넣으면
    // 참조값이 전달(실체가 전달) 따라서 조작하면, 원본도 조작된다.
    function fEx() public returns (uint)
    {
      f3(x);
      return x[2];
    }
    function f2(uint[20] memory y) internal pure {
        y[2] = 3;
    }
    function f3(uint[20] storage y) internal {
        y[2] = 4;
    }
}