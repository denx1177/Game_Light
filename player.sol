
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "gameObjectInterface.sol";

contract player {

    function callAttack(gameObjectInterface _gameObject, address _address) public {
        require(msg.pubkey() == tvm.pubkey(), 102);
	    tvm.accept();
        //Call the remote contract function with parameter.
        _gameObject.attack(_address, tvm.pubkey());
    }
}
