
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

interface gameObjectInterface {
    function takeAttack(int) external;
    function attack(address _address, uint256 _key) external;
}
