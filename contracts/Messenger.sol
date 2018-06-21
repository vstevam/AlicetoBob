pragma solidity ^0.4.24;
/// @title A contract for sent msg and money
/// @author vstevam
contract Messenger{
  address public owner;
  function Messenger() public payable{
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

  /**
   * Setting msg and amount of money to the blockchain
   * @param  _sender    [who is sending the msg and amount of money.]
   * @param  _receiver  []
   * @param  _amount    [qtd of money to send.]
   * @param  _ecMsg     [Msg encypted.]
   * @return msg.ecMsg  [return the msg.]
   */
  function sendMsgandMoney(address _sender, address _receiver, uint _amount, bytes32 _ecMsg) public returns(bytes32){

    //setting the msg and the amount
    msgs[_ecMsg].sender = _sender;
    msgs[_ecMsg].receiver = _receiver;
    msgs[_ecMsg].amount = _amount;
    msgs[_ecMsg].ecMsg = _ecMsg;

    return msgs[_ecMsg].ecMsg;
  }

  /**
   * Check the hash of _ecMsg to claim the amount of money.
   * @param   _ecMsg       msg encrypted.
   * @param   _receiver    who is claiming the money.
   * @param   _amount      qtd of money to claimed.
   * @return  msg.receiver the receiver address.
   */
  function showMsgandClaimMoney(bytes32 _ecMsg, address _receiver, uint _amount) public payable returns(address){
    Msg memory msgB = msgs[_ecMsg];
    require(msgB.ecMsg == _ecMsg);
    _receiver.send(_amount);
    msgs[_ecMsg].amount -= _amount;
    return msgB.receiver;
  }

}
