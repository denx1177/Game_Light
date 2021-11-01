pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "gameObject.sol";

contract warrior is gameObject {

    constructor() gameObject() public {
        _attack = 5;
        _defence = 3;
    }

}