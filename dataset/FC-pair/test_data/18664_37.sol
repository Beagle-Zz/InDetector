contract c18664{
  //@dev revert if sender is whiteListAgent
    modifier OnlyWhiteListAgent() {
        require(msg.sender == whiteListAgent);
        _;
    }
}