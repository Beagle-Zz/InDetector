contract c18043{
    // Update which address is not validated
    // By updating the address, the contributor will receive his contribution back
    function validationFailed(address contributor) onlyOwner public returns (bool) {
        require(contributor != 0x0);
        require(weiContributedPending[contributor] > 0);
        uint256 currentBalance = weiContributedPending[contributor];
        weiContributedPending[contributor] = 0;
        contributor.transfer(currentBalance);
        emit ValidationFailed(contributor, currentBalance, now);
        return true;
    }
}