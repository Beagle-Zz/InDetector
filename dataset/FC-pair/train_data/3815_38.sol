contract c3815{
  /**
    * locks an account for given a number of days
    * @param addr account address to be locked
    * @param periodInDays days to be locked
    */
  function lock(address addr, uint periodInDays) public {
    require(locked[addr] < now && (msg.sender == saleAgent || msg.sender == addr));
    locked[addr] = now + periodInDays * 1 days;
  }
}