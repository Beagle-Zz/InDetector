contract c13657{
  /**
   * @notice Allowing a spender to bypass global frezze
   * @param sender The allowed address
   * @return {"success": "If the operation completed successfuly"}
   */
  function allowFreezeBypass(
    address sender
  )
  public onlyOwner returns (bool success)
  {
    freezeBypassing[sender] = true;
    return true;
  }
}