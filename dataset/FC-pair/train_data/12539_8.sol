contract c12539{
    // transfers an alien deposit back to the sender
    function refundAlienDeposit(address _addr) public onlyWhitelistControl {
        // Note: this implementation requires that alienDeposits has a primitive value type.
        // With a complex type, this code would produce a dangling reference.
        uint256 withdrawAmount = alienDeposits[_addr];
        require(withdrawAmount > 0);
        delete alienDeposits[_addr]; // implies setting the value to 0
        cumAlienDeposits -= withdrawAmount;
        emit Refund(_addr, withdrawAmount);
        _addr.transfer(withdrawAmount); // throws on failure
    }
}