contract c10674{
  /**
  * @dev Gets the all fields for the commitment of the specified address.
  * @param _miner The address to query the the commitment Of
  * @return {
    "uint256 value": the amount commited.
    "uint256 onBlockNumber": block number of commitment.
    "uint256 atStake": stake when commited.
    "int256 onBlockReward": block reward when commited.
    }
  */
  function getCommitment(address _miner) public view 
  returns (
    uint256 value,             // value commited to mining
    uint256 onBlockNumber,     // commited on block
    uint256 atStake,           // stake during commit
    int256 onBlockReward       // block reward during commit
    ) 
  {
    value = miners[_miner].value;
    onBlockNumber = miners[_miner].onBlockNumber;
    atStake = miners[_miner].atStake;
    onBlockReward = miners[_miner].onBlockReward;
  }
}