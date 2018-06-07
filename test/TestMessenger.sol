pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Messenger.sol";

contract TestMessenger{

      Messenger msg = new Messenger();
      bytes32 expectedMsg = sha3('teste');
      uint expectedAmount = 1;


  function testSendMsgandMoney() public {


    Assert.equal(msg.sendMsgandMoney(msg.owner(), tx.origin, expectedAmount, expectedMsg), expectedMsg, "Sent msg and money");
  }

  function testShowMsgandClaimMoney() public {

    Assert.equal(msg.showMsgandClaimMoney(expectedMsg, tx.origin, expectedAmount), tx.origin, "Show the Msg and claim your Money");
  }

}
