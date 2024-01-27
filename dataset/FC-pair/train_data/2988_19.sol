contract c2988{
    /// @dev In the case locking failed, then allow the owner to reclaim the tokens on the contract.
    function recoverFailedLock() onlyOwner {
      if(lockedAt > 0) {
        throw;
      }
      // Transfer all tokens on this contract back to the owner
      token.transfer(owner, token.balanceOf(address(this)));
    }
}