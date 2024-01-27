contract c10847{
    /// @dev Allows the CFO to capture the balance available to the contract.
    function withdrawBalance() external onlyOwner {
        uint balance = address(this).balance;
        cooAddress.send(balance);
    }
}