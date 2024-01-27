contract c1101{
    // Requires msg.sender to be bankroll
    modifier onlyBankroll {
      require(msg.sender == bankroll);
      _;
    }
}