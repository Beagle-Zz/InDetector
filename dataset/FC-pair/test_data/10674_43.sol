contract c10674{
  /**
  * @dev Calculate the reward if withdrawM5() happans on this block
  * @notice This is a wrapper, which calls and return result from M5Logic
  * the actual logic is found in the M5Logic contract
  * @param _miner The address of the _miner
  * @return An uint256 representing the reward amount
  */
  function getM5Reward(address _miner) public view returns (uint256) {
    require(M5Logic_ != address(0));
    if (miners[_miner].value == 0) {
      return 0;
    }
    // check that effective block reward is indeed negative
    require(signedAverage(miners[_miner].onBlockReward, blockReward_) < 0);
    // return length (bytes)
    uint32 returnSize = 32;
    // target contract
    address target = M5Logic_;
    // method signeture for target contract
    bytes32 signature = keccak256("getM5Reward(address)");
    // size of calldata for getM5Reward function: 4 for signeture and 32 for one variable (address)
    uint32 inputSize = 4 + 32;
    // variable to check delegatecall result (success or failure)
    uint8 callResult;
    // result from target.getM5Reward()
    uint256 result;
    assembly { // solium-disable-line
        // return _dest.delegatecall(msg.data)
        mstore(0x0, signature) // 4 bytes of method signature
        mstore(0x4, _miner)    // 20 bytes of address
        // delegatecall(g, a, in, insize, out, outsize)	- call contract at address a with input mem[in..(in+insize))
        // providing g gas and v wei and output area mem[out..(out+outsize)) returning 0 on error (eg. out of gas) and 1 on success
        // keep caller and callvalue
        callResult := delegatecall(sub(gas, 10000), target, 0x0, inputSize, 0x0, returnSize)
        switch callResult 
        case 0 
          { revert(0,0) } 
        default 
          { result := mload(0x0) }
    }
    return result;
  }
}