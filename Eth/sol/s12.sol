pragma solidity ^0.5.7;

// 이벤트

// 디앱에서(솔리디티로 만든) 이벤트가 발생하여, 혹은 특정상황을 외부로
// 전달시키고자 할때 사용하는 방식이 이벤트
// 이벤트를 발생시키면, js에서는 콜백함수를 받아서 처리하게 된다
// -> 비동기, 트렌젝션 작업은 즉각적이지 않으므로 이벤트를 통해 외부로 전달
contract BasicEvent
{
    event myEvent (
        address _from,
        address _to,
        uint _amt
    );
    function pay(address _to) public payable
    {
        // 상황 : 뭔가 일을 했고, 그 대가로 지불하거나 등등
        // transaction
        emit myEvent( msg.sender, _to, msg.value );
    }
}