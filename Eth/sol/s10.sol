pragma solidity ^0.5.7;

// 구조체
// - 사용자 정의 타입
// - 어떤 타입의 변수도 맴버로 담을 수 있다.
// - 매핑형태의 키로는 사용이 불가
// - 구조체는 스토리지에 저장된다 -> 상태변수로만 존재
// - 자기참조 => depth 제한
// - 구조체 배열은 3번, 매핑값으로 대체하는 방식은 2번까지만 허용
// 구조체를 리턴한다면 삽입

pragma experimental ABIEncoderV2;
contract BasicMapping
{
    // define
    struct person {
        uint8 age;
        bool isMale;
    }
    struct player {
        uint8[5] points;
        uint8 team;
        person p;
    }
    mapping (address=>player) players;
    // create
    player p1 =  player( [60,60,60,60,70], 1, person( 26, false ) );
    
    constructor () public
    {
        players[ msg.sender ] = p1;
    }
    // 플레이어 획득
    function getPlayer() public view returns (player memory)
    {
        return players[ msg.sender ];
    }
    // 함수 : getPlayerMean()
    // output : uint8
    // 본 컨트렉트를 구동한자의 점수 평균값을 리턴하시오
    function getPlayerMean() public view returns (uint8)
    {
        // 타입, 값의 변화 신경써서 관리   
        uint8 size = uint8(players[msg.sender].points.length);
        uint sum = 0;
        for(uint8 i=0; i<size; i++){
            // 구조체의 맴버를 접근할때는 구조체.맴버
            sum += players[msg.sender].points[i];
        }
        uint8 mean = uint8(sum/size);
        return mean;
    }
    // 자기 참조(재귀적)depth 제한
    // B tree : 자기 자신을 자식으로 3번까지 가능
    struct caseA
    {
        uint a;
        caseA[] b;
    }
    // binary tree : 이진트리, 자기 자신을 2번까지 가능
    struct caseB
    {
        uint a;
        mapping(bool=>caseB) b;
    }
    
}