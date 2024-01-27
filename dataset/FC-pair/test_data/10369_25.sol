contract c10369{
    // Checks if msg.sender can collect tokens
    function canCollect() public view onlyReserveWallets returns(bool) {
        return block.timestamp > timeLocks[msg.sender] && claimed[msg.sender] == 0;
    }
}