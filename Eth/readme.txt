1. 블록체인 역사, 구조, 특징, 이해 등등

2. 2세대 블록체인 대표주자 이더리움 구축
   - 1세대 : 비트코인(대장주) -> 블록체인상에 화폐만 구현된 형태
   - 1단계 : 네트워크 구축(블록체인 구현되어 있다.)
   -         이더리움 기반의 네트워크 구축(이더리움을 구축한 언어는 다양하다 -> 구글의 Go를 기반으로 만든 것을 가장 많이 사용 -> Geth)
   -         https://geth.ethereum.org/downloads 윈도우용 다운로드
   - 네트워크 설치 위치 지정
     네트워크: 상용 <- 테스트 <- private 3가지 형태로 존재
     window
     $ mkdir C:\eth_net
     $ cd C:\eth_net
     $ mkdir ./eth_net/Geth
     $ mkdir ./eth_net/Geth/ethereum
     $ mkdir ./eth_net/Geth/ethereum/data

     linux
     $ mkdir ./eth_net/
     $ mkdir ./eth_net/Geth
     $ mkdir ./eth_net/Geth/ethereum
     $ mkdir ./eth_net/Geth/ethereum/data
   - geth 설치
   - 계정생성
     현재위치는 C:/eht_net
     $ geth --datadir "./ethereum/data" account new
   - 계정확인
     $ geth --datadir "./ethereum/data" account list

     ico행사에 투자를 받아서(예를들면) 1명이 돈을 내고 주주가 되었다
     => 계좌를 하나 생성해주었다
     => 현재 계좌는 2개(소유주, 주주1명)
     소유주:b18d7f6f610662998c0cbae9c6747c191835e416
     주주1명:b580f8b9c5ad2eaf9799845c9a37ae3df59749e1

     - 네트워크 구정을 위해 제네시스 블록 구성 파일을 위치해둔다
     => 최초 블록을 쌓게된다
     => C:\eth_net\Geth\Genesis.json 위치
   - 제네시스 블록을 가지고 초기 네트워크를 구축 명령 수행
     $ geth --datadir "./ethereum/data" init "./Genesis.json"
   - 네트워크 가동  
     $ geth 
     --identity "PrivateNetwork"  : 네트워크 이름
     --datadir "./ethereum/data"   : 네트워크 위치
     --port "30303"                : 네트워크의 Listening Port 지정
     --rpc                         : 원격접속 및 명령 수행 OK, Enable the HTTP-RPC server
     --rpcaddr 0.0.0.0             : RPC서버 주소
     --rpcport "8123"              : RPC서버 포트
     --rpccorsdomain "*"           : 기재하면 도메인으로도 접속 가능
     --nodiscover                  : 제네시스 블럭과 네트워크 ID에 있는 블록 연결 금지
     --networkid 1900              : 네트워크 아이디
     --nat "any"                   : 외부 주소와 내부 주소간 변화 처리
     --rpcapi "db, eth, net, web3, miner, personal" : 콘솔로 오픈이 되는 api 목록, web3=>js사용가능
     console                       : 콘솔모드 오픈, 모든 출력은 콘솔로 진행

     $ geth --identity "PrivateNetwork" --datadir "./ethereum/data" --port "30303" --rpc --rpcaddr 0.0.0.0 --rpcport "8123" --rpccorsdomain "*" --nodiscover --networkid 1900 --nat "any" --rpcapi "db, eth, net, web3, miner, personal" console

   - 원격 접속
     $ geth attach http://54.180.103.108:8123
   - 계좌 확인
     $ eth.accounts
   - 잔고 확인
     $ eth.getBalance( eth.accounts[0] )

    [리눅스 상에서 네트워크 구축]
    - 이더리움 설치
     $ sudo apt-get update
     $ sudo apt-get upgrade
     $ sudo apt-get install software-properties-common
     $ sudo add-apt-repository ppa:ethereum/ethereum
     $ sudo apt-get update
     $ sudo apt-get install ethereum
     - 네트워크 구축
      $ mkdir ./eth_net
      $ mkdir ./eth_net/Geth
      $ mkdir ./eth_net/Geth/ethereum
      $ mkdir ./eth_net/Geth/ethereum/data
      $ cd ./eth_net/Geth
      $ geth --datadir "./ethereum/data" account new
        0xb0d9301A33e983bb06D932e612aaEC98c45D1d50 : 소유주
        0xCAbd5dbD54C11B813A559be5d6964B33D41b1535 : 주주
      $ nano Genesis.json
        편집 및 hash 값 세팅
      $ cat Genesis.json
        파일 내용 보기
      $ geth --datadir "./ethereum/data" init "./Genesis.json"
      $ geth --identity "PrivateNetwork" --datadir "./ethereum/data" --port "30303" --rpc --rpcaddr 0.0.0.0 --rpcport "8123" --rpccorsdomain "*" --nodiscover --networkid 1900 --nat "any" --rpcapi "db, eth, net, web3, miner, personal" console
    - 원격 접속
      $ geth attach http://54.180.103.108:8123
    - 계좌 확인
      $ eth.accounts
    - 잔고 확인
      $ eth.getBalance( eth.accounts[0] )
      
3. 이더리움의 사설 네트워크 외부에서 연동하는 방법(RPC)
   - 전자지갑 구현
   1) PRC 접속을 통해서 명령을 전송하여 수행
   2) MIST 브라우저(이더리윔 GUI 툴) 수행
   3) nodejs 기반 client side에서 수행
   4) nodejs 기반 server side에서 수행 : restAPI 스타일
   5) nodejs 기반 socket.io를 이용한 실시간 통신으로 : 소켓통신

4. 솔리디티 언어 이해 (이더리움 네트워크 상에 프로그램이 가미된 앱을 개발하는 언어)

5. DApp 구성 (Node 기반, 사설네트워크 + node 서비스 )
   - 전자지갑
   - 전자투표
   - 배팅시스템