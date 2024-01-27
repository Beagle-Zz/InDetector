contract c2874{
    /// @notice ICO participation
    function buy() public payable {     // dont mark as external!
        internalBuy(msg.sender, msg.value, true);
    }
}