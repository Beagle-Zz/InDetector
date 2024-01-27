contract c18913{
    // @dev Allows the CEO to capture the balance available to the contract.
    function withdrawBalance() external onlyCFO {
        address tmp = address(this);
        cfoAddress.transfer(tmp.balance);
    }
}