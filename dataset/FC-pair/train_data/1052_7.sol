contract c1052{
    // Require msg.sender to be owner
    modifier onlyOwner {
      require(msg.sender == owner); 
      _;
    }
}