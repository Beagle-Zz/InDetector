contract c18600{
  /*
    contract for teams tokens lockup
  */
  function setTeamTokenHolder(address _teamTokenHolder) onlyOwner public {
    require(_teamTokenHolder != address(0));
    // should allow set only once
    require(teamTokenHolder == address(0));
    teamTokenHolder = _teamTokenHolder;
  }
}