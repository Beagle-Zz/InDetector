contract c8844{
    // @dev Allows the CFO to capture the balance available to the contract.
    function withdrawBalance() external onlyCFO {
        uint256 balance = this.balance;
        // Subtract all the currently pregnant cats we have, plus 1 of margin.
        uint256 subtractFees = (pregnantLinglongCats + 1) * autoBirthFee;
        if (balance > subtractFees) {
            cfoAddress.transfer(balance - subtractFees);
        }
    }
}