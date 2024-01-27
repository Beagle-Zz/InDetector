contract c8669{
    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param _newOwner The address to transfer ownership to.
     */
    function transferOwnership(address _newOwner) onlyOwner public {
      if(!canRenounce){
        require(_newOwner != address(0));
      }
      emit OwnershipTransferred(owner, _newOwner);
      owner = _newOwner;
    }
}