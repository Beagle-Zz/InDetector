contract c12323{
  /**
   * @dev Allows the owner to withdraw ethers from the contract.
   * @param ethers quantity of ethers to be withdrawn
   * @return true if withdrawal successful ; false otherwise
   */
  function withdrawEther(uint256 ethers)
      public
      onlyOwner
  {
      if (this.balance >= ethers) {
          msg.sender.transfer(ethers);
      }
  }
}