pragma solidity ^0.5.7;

// 문자열, 아직 컴파일러가 발전하는 단계이므로,
// 우리가 편히 사용했던 라이브러리가 많이 없다.
// 일일이 만들어 줘야 한다.
contract BasicString
{
    // 문자열 기초 라이브러리 만들기
    // bytes[] -> string
    function byteArrayToString( byte[] memory src ) public pure returns (string memory)
    {
        // byte[] -> bytes -> string
        // byte[] -> bytes
        // 입력한 byte 배열의 크기만큼 bytes의 크기를 잡아준다.
        bytes memory buffer = new bytes(src.length);
        // 인덱스별로 카피
        for(uint8 i=0; i < src.length; i++){
            buffer[i] = src[i];
        }
        // 문자열 변환, 모든 데이터는 bytes에 담겼으므로, string 변환
        return string( buffer );
    }
    // string -> bytes -> byte[] -> bytes -> string
    // string -> bytes -> byte[] 함수
    function stringToByteArray( string memory src ) public pure returns (byte[] memory)
    {
        // string -> bytes
        bytes memory tmp = bytes( src );
        // bytes -> byte[]
        byte[] memory buffer = new byte[]( tmp.length );
        for(uint8 i=0; i < tmp.length; i++){
            buffer[i] = byte(tmp[i]);
        }
        return buffer;
    }
    // test
    // string -> bytes -> byte[] -> bytes -> string
    function testSTBATS( string memory src ) public pure returns (string memory)
    {
        return byteArrayToString( stringToByteArray(src) );
    }
    // 문자열 더하기
    // addString
    // input : string, string => string -> bytes 변환 2개
    // output : string
    // 입력된 문자열을 이어 붙여서 리턴하는 함수
    // 문자열을 bytes 변환하여 2개 합한 크기로 버퍼를 만들어서 차례대로 복사후
    // 문자열화 시키면 
    // 1. 함수의 외형부터 완성
    function addString(  string memory a, string memory b ) public pure returns (string memory)
    {
        // 2. input string -> bytes 변환 2개, s1, s2 variable name
        bytes memory s1 = bytes( a );
        bytes memory s2 = bytes( b );
        // 3. 2개 합한 크기로 버퍼를 만들어 -> dynamic create
        bytes memory buffer = new bytes( s1.length + s2.length );
        // 4. copy
         for(uint8 i=0; i < s1.length; i++){
            buffer[i] = (s1[i]);
        }
         for(uint8 i=0; i < s2.length; i++){
            buffer[i+s1.length] = (s2[i]);
        }
        // 5. string
        return string ( buffer );
    } 
    // 문자열 자르기
    // subString()
    // input : string, offset(시작위치), len(길이)
    // output : string
    function subString( string memory src, uint offset, uint size ) public pure returns (string memory)
    {
        // string -> bytes
        bytes memory tmp = bytes( src );
        // check point offset + size -> tmp.length -> error
        // 에러가 발생함으로 그냥 원본값을 리턴
        if(offset + size > tmp.length){
            return src;
        }
        // 정상적으로 자를 수 있다.(단, 한글은 배제, 바이트수가 달라서 방식이 다름)
        // 자른 문자열이 들어갈 버퍼 생성
        // 1바이트 문자들만 해당, 영문, 숫자, 특수문자
        bytes memory buffer = new bytes( size );
        // copy
        for(uint i=0; i < size; i++){
            buffer[i] = tmp[i + offset];
        }
        // return
        return string( buffer );
    }
}