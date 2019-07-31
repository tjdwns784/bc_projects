1. 블록체인 역사, 구조, 특징, 이해 등등
 - 블록체인 1.0 (비트코인)
  1) 분산원장 시스템을 활용
  2) 탈중앙화, 작업증명, p2p 시스템 <-> client/server 시스템
  3) 기술의 신뢰성을 높이는 쪽에 주안점을 두었다.
  4) 이런 기술을 증명하기 위해 -> 화페에 적용 -> 중앙 은행으로부터 독립성을 이루는데 목적
  5) 비트코인이 탄생
 - 블록체인 2.0
  1) 디지털 화페를 넘어서자
  2) 자산(주식, 모기지, 부동산, 계약)들에 대한 생성과 거래가 가능하게 되었다
  3) 거래의 대상을 확장시켜서 가치가 높아졌다
  4) ethereum(이더리움), Ripple, NXT, ....
  5) 블록체인 1.0에 프로그래밍이 가능한 구조로 발전
  6) 스마트 계약(스마트 컨트랙트)
   -> DApp(탈중앙화 어플리케이션, Decentrallzed Application)
  7) 이더리움
   -> 2015년 7월 
   -> 비탈릭 부테린
   -> 1세대 블록체인 대비(가상화폐) + 프로그래밍 기능 => 2세대(진화된)
   -> 프로그래밍이 가능하다 => 다양한 분야로 확장성을 보였다.
 - 스마트컨트렉스
  -> 화폐의 관전보다 명령어등 프로그램 탑재
  -> 프로그래밍이 가능한 디지털 화폐단위
  -> 블록체인을 통해서 작업증명을 하는 과정을 계약 당사자간의 확인으로 대신할 수 있다.
  -> 부산블록체인특구
  https://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=105&oid=092&aid=0002167095
 - 미래
  -> 블록체인 3.0 시대 ~
  -> 화폐, 금융, 마켓, 정부, 헬스, 과학, 문화 분야 전분야 확산 가능
  -> 각각의 디바이스를 블록체인으로 연결하는 네트워크 구성 가능
  -> 새로운 서비스들이 등장


2. 2세대 블록체인 대표주자 이더리움 구축
 - 1세대 : 비트코인 (대장주) -> 블록체인상에 화폐만 구현된 형태
 - 1단계 : 네트워크 구축 (블록체인 구현되어 있다)
 -        이더리움 기반의 네트워크 구축 (이더리움을 구축한 언어는 다양하다. 
          -> 구글의 Go를 기반으로 만든 것을 가장 많이 사용 -> Geth)
 -        https://geth.ethereum.org/downloads 윈도우용 다운로드
 - 네트워크 설치 위치 지정
  네트워크: 상용 <- 테스트 <- private 3가지 형태로 존재
  window
  $ mkdir C:\eth_net
  $ cd C:\eth_net
  $ mkdir ./eth_net/Geth
  $ mkdir ./eth_net/Geth/ethereum
  $ mkdir ./eth_net/Geth/ethereum/data

  linux
  $ mkdir ./eth_net
  $ mkdir ./eth_net/Geth
  $ mkdir ./eth_net/Geth/ethereum
  $ mkdir ./eth_net/Geth/ethereum/data
 - geth 설치
 - 계정생성
  현재위치는 C:\eth_net
  $ geth --datadir "./ethereum/data" account new
 - 계정 확인
  $ geth --datadir "./ethereum/data" account list
 - IOC 행사에 투자를 받아서(예를들면) 1명이 돈을 내고 주주가 되었다.
  => 계좌를 하나 생성해 주었다.
  => 현재 계좌는 2개(소유주, 주주1명)
  소유주: 756e992d8ebce41426e523e66176701658ae7aa4
  주주1명: 63732b4ab2a1d5e4e33af07b6940f321bcd1b279
 - 네트워크 구성을 위해 제네시스 블록 구성 파일을 위치해둔다
  => 최초 블록을 쌓게된다.
  => C:\eth_net\Geth\Genesis.json 위치
 - 제네시스 블럭을 가지고 초기 네트워크를 구축 명령 수행
  $ geth --datadir "./ethereum/data" init "./Genesis.json" 
 - 네트워크 가동
  $ geth 
   --identity "PrivateNetwork" :네트워크 이름
   --datadir "./ethereum/data" : 네트워크 위치
   --port "30303": 네트워크의 Listening Port 지정
   --rpc : 원격접속 및 명령수행 OK, Enable the HTTP-RPC server
   --rpcaddr 0.0.0.0 : RPC서버 주소 => 기본값 localhost
   --rpcport "8123" : PRC 서버 포트
   --rpccorsdomain "*" : 기재하면 도메인으로도 접속 가능
   --nodiscover : 제네시스 블럭과 네트워크 ID에 있는 블록 연결 금지
   --networkid 1900 : 네트워크 아이디
   --nat "any" : 외부 주소와 내부 주소간 변화 처리
   --rpcapi "db, eth, net, web3, miner, personal" : 콘솔로 오픈이 되는 api 목록, web3 => js 사용가능 
   --allow-insecure-unlock : 계좌 연락 허가 추가
   console : 콘솔모드 오픈, 모든 출력은 콘솔로 진행

  $ geth --identity "PrivateNetwork" --datadir "./ethereum/data" --port "30303" --rpc --rpcaddr 0.0.0.0 --rpcport "8123" --rpccorsdomain "*" --nodiscover --networkid 1900 --nat "any" --rpcapi "db, eth, net, web3, miner, personal" --allow-insecure-unlock console

 - 원격접속
  $ geth attach http://localhost:8123
 - 계좌 확인
  $ eth.accounts
 - 잔고 확인
  $ eth.getBalance(eth.accounts[0])

 [리눅스 상에서 네트워크 구축]
 $ sudo apt-get update
 $ sudo apt-get upgrade
 $ sudo apt-get install software-properties-common
 $ sudo add-apt-repository ppa:ethereum/ethereum
 $ sudo apt-get update
 $ sudo apt-get install ethereum
 $ mkdir ./eth_net
 $ mkdir ./eth_net/Geth
 $ mkdir ./eth_net/Geth/ethereum
 $ mkdir ./eth_net/Geth/ethereum/data
 $ cd ./eth_net/Geth
 $ geth --datadir "./ethereum/data" account new <= 2번 수행
    0xC7589Ac9336c592A809bE6471559b21fa353E1C0 : 소유주
    0x632a50E8dC14F671457503213F97424AeF3eF592 : 주주
 $ nano Genesis.json
 편집 및 hash 값 세팅
 $ cat Genesis.json
 파일 내용 보기
 $ geth --datadir "./ethereum/data" init "./Genesis.json" 
 $ geth --identity "PrivateNetwork" --datadir "./ethereum/data" --port "30303" --rpc --rpcaddr 0.0.0.0 --rpcport "8123" --rpccorsdomain "*" --nodiscover --networkid 1900 --nat "any" --rpcapi "db, eth, net, web3, miner, personal" console
 - 원격접속
  $ geth attach http://52.78.80.198:8123 (내 아마존 아이피)
 - 계좌 확인
  $ eth.accounts
 - 잔고 확인
  $ eth.getBalance(eth.accounts[0])

3. 이더리움의 사설 네트워크 외부에서 연동하는 방법(RPC)
 - 전자지갑 구현
  1) PRC 접속을 통해서 명령을 전송하여 수행
  2) MIST 브라우저(이더리움 GUI 툴) 수행
  3) nodejs 기반 client side에서 수행
  4) nodejs 기반 server side에서 수행 - restAPI 스타일
  5) nodejs 기반 socket.io를 이용한 실시간 통신으로 수행 : 소켓통신
 - 원격 접속 상황에서
  -> 계좌 생성
  $ personal.newAccount('1234')
   "0x04bd9f77fc57d3923c5878c7da79b09aa53dc55a"

  송금행위 
   -> 트랜잭션 (마이닝 작업을 통해 처리가 된다)
   -> 여기에는 이런 행위가 적합한지 블록체인의 참여자(노드)들의
      합의 원칙에 따라 검증 후 OK되면 장부에 기록이 되고, 그때
      돈이 들어오게 된다.
   Error: authentication needed: password or unlock
   => 트랜잭션 수행을 위해(수수료가 발생되거나, 송금행위등)
   발생자(from)의 계정을 풀고(풀려면 비번을 입력받는다)
   진행시켜야한다.
   $ personal.unlockAccount(eth.accounts[0],'1234')
   송금
   $ eth.sendTransaction({
      from:eth.accounts[0]
      to:eth.accounts[1]
      value:web3.toWei(1,'ether')
   })
   "0x17a3cf793327fcedfc9629e9d90aceb8d0f396c89bd5262a45bf96c1e3bb002c"
   트랜잭션 확인
   $ eth.pendingTransactions
   송금행위를 처리하기 위해 miner.start()
   miner.start() 평시에는 계속해서 가동중이여서 여기서는 필요할때만
   구동하고, 멈추는 식으로 처리한다
   $ miner.start()

   - 화폐단위
   1 ether = 1,000,000,000,000,000,000 wei(수수료 지급용:wei)
             wei < Kwei < Mwei < Gwei
   1 ether = 1,000,000,000 Gwei (가장 일반적인 가스 지급단위)
   1 ether = 1,000,000 Szabo(수수료 지급용)
   1 ether = 1,000 Finney (소액 결제용)
   1 ether = 0.001 Kether
             Kether < Mether < Gether < Tether

   - MIST 브라우저
    -> 이더리움 상용/테스트/사설 네트워크에 모두 접속 가능
    -> 네트워크 구동이 없는 상태에서 접속하면 무조건 상용으로 붙게되고 노느가 동기화되면서
       저장 데이터가 켜지고, 로드가 많이 걸린다(주의)
    -> 구동전에 반드시 사설 네트워크 가동시킨 후에 구동한다
    -> https://github.com/ethereum/mist/releases
       Mist-installer-0-11-1.exe 다운로드
    -> 계좌 생성, 송금, 트랜잭션 처리 확인
    -> 스마트 컨트렉트 빌드 -> 배포하는 위치도 확인
 
 - Nodejs 연동
  -> node 프로젝트에서 web3설치
  $ npm install web3@0.16.0  (특정버전설치할때는 @쓰고 버전쓰면됨.)
  -> 프로젝트 생성
   $ cd c:\dev\test_git\bc_projects\Eth\DApp
   $ express -e mini_wallet
   $ cd mini_wallet
   $ npm install
   $ npm install web3@0.16.0
   $ package.json에서 node ./bin/www => nodemon ./bin/www
   $ npm start
   web3는 이더리움 네트워크에 접속하여 RPC 코멘드를 사용할 수 있다.
   사용관련 api는 네트워크 가동 시 허가된 모듈만 사용가능
   [클라이언트 side에서 사용하기 위해]
   node_modules/web3/dist/web3-light.min.js 이 파일을 
   public/lib(새로생성)/web3-light.min.js
   node_modules/web3/bignumber.js(폴더)/bignumber.min.js 이 파일을 
   public/lib(새로생성)/bignumber.min.js
   -> 코드에서 확인
   
4. 솔리디티 언어 이해 (이더리움 네트워크 상에 프로그램이 가미된 앱을 개발하는 언어)
 - 에디터 : remix
 https://remix.ethereum.org

5. DApp 구성 ( Node 기반, 사설 네트워크  + node 서비스 )
 - 전자지갑
 - 전자투표
   1) 기능
      - 후보자 등록 : 원래는 선관위에서 진행해야 하나, 편의상 어떤 계정이던 추가할 수 있게 처리
      - 후보자별 득표수 조회
      - 계좌(선거구 주민, 국민, ...)별 투표가 가능
      - 중복 투표는 거절(한 사람은 한번의 투표만 가능)
   2) 절차
      - vote.sol를 생성 및 작성 및 테스트 : remix 진행
      - contact를 MIST 브라우저를 통해 네트워크로 배포
        1) MIST 브라우저로 배포
        2) solc라는 컴파일러를 직접 설치하여(리눅스가 편함) 직접 빌드 후 배포까지
        3) 터틀이라는 nodejs의 모듈을 이용하여 자동화 하는 방법
      - 이런 contact를 nodejs에서 연결하여, 투표 사이트를 구축
      - socket.io를 이용한 실시간 통신을 통한 투표 시스템의 오퍼레이션을 구성하겠다.
 - 배팅시스템..