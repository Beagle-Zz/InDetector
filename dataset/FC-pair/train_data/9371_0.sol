contract c9371{
    //Only owners can generate a forwarder
    modifier onlyOwnerOrCreator {
      require(msg.sender == owner1 || msg.sender == owner2 || msg.sender == owner3 || msg.sender == creator);
      _;
    }
}