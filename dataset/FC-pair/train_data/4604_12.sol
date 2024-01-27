contract c4604{
    // only owner
    function fixWithdrawalAddress(address _withdrawalAddress) public returns (bool) {
        require(msg.sender == owner);
        require(withdrawalAddress == _withdrawalAddress);
        // prevents event if already fixed
        require(!withdrawalAddressFixed);
        withdrawalAddressFixed = true;
        WithdrawalAddressFixed(withdrawalAddress, msg.sender);
        return true;
    } //
}