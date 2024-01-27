contract c10776{
  // The address.call() syntax is no longer recommended, see:
  // https://github.com/ethereum/solidity/issues/2884
  function executeCall(address to, uint256 value, bytes data) internal returns (bool success) {
    assembly {
      success := call(gas, to, value, add(data, 0x20), mload(data), 0, 0)
    }
  }
}