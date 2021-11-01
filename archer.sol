pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "gameObject.sol";

contract archer is gameObject {

    constructor() gameObject() public {
        _attack = 6;
        _defence = 2;
    }
}
