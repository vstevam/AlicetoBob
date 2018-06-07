pragma solidity ^0.4.24;

contract Messenger{
  address public owner;
  function Messenger() public{
    owner = msg.sender;
  }

  struct Msg {
    bytes32 ecMsg;
    uint amount;
    address sender;
    address receiver;
  }
  //map hashing the hash
  mapping(bytes32 => Msg) public msgs;


  function sendMsgandMoney(address _sender, address _receiver, uint _amount, bytes32 _ecMsg) public returns(bytes32){
    var msg = msgs[_ecMsg];
    //setting the msg and the amount
    msg.sender = _sender;
    msg.receiver = _receiver;
    msg.amount = _amount;
    msg.ecMsg = _ecMsg;

    return msg.ecMsg;
  }

  function showMsgandClaimMoney(bytes32 _ecMsg, address _receiver, uint _amount) public returns(address){
    var msg = msgs[_ecMsg];
    require(msg.ecMsg == _ecMsg);
      //msg.receiver.transfer(_amount);
      return msg.receiver;
  }

}
