contract c3102{
    /**
     * revert if called by any account except owner.
     */
    modifier onlyOwner() {
      require(msg.sender == owner);
      _;
    }
}