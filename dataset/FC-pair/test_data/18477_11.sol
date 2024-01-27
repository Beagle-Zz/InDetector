contract c18477{
   /**
   * @notice Transfers tokens held by lock.
   */
   function unlock() public constant returns (bool success){
        uint256 amount = lockedBalance[msg.sender];
        require(amount > 0);
        require(now >= timeRelease[msg.sender]);
        balances[msg.sender] = balances[msg.sender].add(amount);
        lockedBalance[msg.sender] = 0;
        timeRelease[msg.sender] = 0;
        Transfer(0x0, msg.sender, amount);
        UnLock(msg.sender, amount);
        return true;
    }
}