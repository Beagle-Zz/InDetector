contract c9365{
    //Only owners can generate a forwarder
    modifier onlyOwnerOrCreator {
      require(msg.sender == owners[0] || msg.sender == owners[1] || msg.sender == owners[2] || msg.sender == creator);
      _;
    }
}