contract c10674{
  /**
  * @dev withdraw M5 reward, only appied to mining when GDP is negative
  * @return {
    "uint256 reward": the new M5 supply
    "uint256 commitmentValue": the commitment to be returned
    }
  */
  function withdrawM5() public returns (uint256 reward, uint256 commitmentValue) {
    require(M5Logic_ != address(0));
    require(M5Token_ != address(0));
    require(miners[msg.sender].value > 0); 
    // will revert if reward is positive
    reward = getM5Reward(msg.sender);
    commitmentValue = miners[msg.sender].value;
    require(M5Logic_.delegatecall(bytes4(keccak256("withdrawM5()")))); // solium-disable-line
    return (reward,commitmentValue);
  }
}