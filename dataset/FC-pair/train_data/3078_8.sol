contract c3078{
    /**
     * revert if called by any account except owner.
     */
    modifier onlyOwner() {
      require(msg.sender == owner);
      _;
    }
}