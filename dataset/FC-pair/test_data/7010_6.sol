contract c7010{
    /// @dev Withdraw all owner
    function withdraw() onlyOwner {
        msg.sender.transfer(this.balance);
    }
}