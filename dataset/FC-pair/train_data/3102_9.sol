contract c3102{
    /**
     * Allows the current owner to transfer control of the contract to a newOwner.
     * param newOwner The address to transfer ownership to.
     */
    function changeOwner(address newOwner) onlyOwner public {
      require(newOwner != address(0));
      owner = newOwner;
      emit ChangeOwner(owner, newOwner);
    }
}