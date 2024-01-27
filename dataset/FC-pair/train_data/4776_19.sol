contract c4776{
   /**
    * @dev Allows the current owner to relinquish control of the contract
    * @notice Renouncing to ownership will leave the contract without an owner
    * It will not be possible to call the functions with the `onlyOwner`
    * modifier anymore
    */
   function renounceOwnership() public onlyOwner 
   {
      require(!stopped);
      owner = address(0x0);
      emit OwnershipRenounced(owner);
   }
}