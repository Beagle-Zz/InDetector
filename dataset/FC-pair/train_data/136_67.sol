contract c136{
    /// @dev requires the sender to be on the contract owners list
    modifier onlyCLevelAccess() {
        require((jokerAddress == msg.sender) || (knightAddress == msg.sender) || (paladinAddress == msg.sender),"not c level");
        _;
    }
}