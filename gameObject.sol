pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "gameObjectInterface.sol";

contract gameObject is gameObjectInterface {

    int public _defence;
    int public _attack;
    int public _health = 10;
    address public _attakingAddress;
 
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }
    modifier checkOwnAndValue (int _value) {
        require(msg.pubkey() == tvm.pubkey(), 102);
        require(_value >= 0, 110);
        tvm.accept();
        _;
    }
    function getProtection(int _value) public checkOwnAndValue(_value)  {
        _defence =  _value;
    }
    function getAttackPower(int _value)  public checkOwnAndValue(_value) {
        _attack = _value;
    }    
    function takeAttack(int _valueAttack) external override {
        tvm.accept();
        _attakingAddress = msg.sender;
        int _damage = _valueAttack - _defence;
        if (_damage > 0) { _health -= _damage; }
        if (!isLive()) { death(); }
    }
    function attack(address _address, uint256 _pubkey) external override {
        require(_pubkey == tvm.pubkey(), 109);
        tvm.accept();
        gameObjectInterface(_address).takeAttack(_attack);
    }    
    function isLive() internal returns (bool) {
        tvm.accept();
        if (_health > 0) { return true; }
        else { return false; }
    }
    function death() internal {
        tvm.accept();
        selfDestroy();
    }
    function selfDestroy() internal {
        tvm.accept();
        _attakingAddress.transfer(1, true, 160);
    }
}