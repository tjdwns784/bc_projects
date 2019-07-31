pragma solidity ^0.5.7;

// 복합타입 : 배열, 구조체, 문자열, 이벤트, ...
contract BasicArrayTest
{
    // 배열 선언
    uint8[2] myArr;
    // 배열 선언 및 초기화
    uint8[2] myArr2 = [1,2];
    // 배열 선언 및 초기화의 사이즈 생략
    uint8[] myArr3 = [1,2];
    uint256[] myArr4 = [1,2];
    
    // 함수, memory 키워드 사용
    function arrTest1() public view returns (uint256)
    {
        // memory 변수는 명시적으로 memory 키워드를 사용해야 한다.
        // 함수 호출시 내부에만 존재하는 임시 변수(오직 함수내부)
        // storage 변수 대비 저렴하다(싸다, 비용이 들지 않는다)
        uint8[3]  memory arr1 = [1,2,3];
        uint8[] memory arr2 = new uint8[](arr1.length);
        // 상태변수를 지역변수에 대입하는 행위 => copy
        // 상태변수를 memory변수에 넣고 지역변수를 수정하면, 상태변수에 영향을 미치지 않는다.
        // why? 상태변수값이  카피되기때문에 상태변수는 보전된다.
        uint256[] memory arr5 = myArr4;
        arr5[0] = 10;
        return arr5[0];
    }
    function arrTest1_sub() public view returns (uint256)
    {
        return myArr4[0];
    }
    
    // 바이트 배열
    // byte,bytes
    function byteTest() public pure
    returns (byte and_v, byte or_v, byte xor_v, byte neg_v)
    {
        byte a = 0x00;
        byte b = 0xff;
        // bit
        and_v = a & b;
        or_v = a | b;
        xor_v = a ^ b;
        neg_v = ~a;
    }
    // bytes
    function bytesTest() public pure returns(bytes2 arr)
    {
        // bytes : 정벅 바이트 계열, 선언시 고정 크기를 가진다.
        arr;
        arr = "AB";
        // 사이즈 overfull -> error
        // arr = "ABC";
        // 바이트 배열을 동적으로 구성하여, 사이즈 넘었을때 사용하면
        // 유동적으로 조절이 된다. -> gas 발생, 고정크기를 권장
        bytes memory dyBytesArr = new bytes(2);
        // 유동적으로 조절이 된다. -> gas 발생
        dyBytesArr = "ABC";
        // 동적생성된 변수는 리턴 불가
    }
    // 바이츠 -> 바이트 배열에 복사
    // 메모리로 선언된 변수를 리턴
    function bytesToByteArr() public pure returns(byte[] memory)
    {
        // bytes -> byte[]
        bytes memory tmp = new bytes(5);
        tmp = "ABCDE";
        
        // byte[] 생성
        byte[] memory result = new byte[]( tmp.length );
        for(uint8 i=0; i<tmp.length; i++){
            result[i] = tmp[i];
        }
        return result;
    }
    // bytes -> string
    function bytesToString() public pure returns(string memory)
    {
        bytes memory tmp = new bytes(5);
        tmp = "ABC123!@#가나다abc";
        string memory s = string( tmp );
        return s;
    }
}
