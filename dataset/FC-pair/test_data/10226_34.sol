contract c10226{
  // The balances of the token, per ERC20, but stored in contract storage (rocketStorage)
  // mapping(address => uint256) token.balances;
  // The totalSupply of the token, per ERC20, but stored in contract storage (rocketStorage)
  // uint256 token.totalSupply;
  // The authorizations of the token, per ERC20, but stored in contract storage (rocketStorage)
  // This is accomplished by hashing token.allowed + _fromAddr + _toAddr
  // mapping (address => mapping (address => uint256)) internal allowed;
  /**
  * @dev total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return rocketStorage.getUint(keccak256("token.totalSupply"));
  }
}