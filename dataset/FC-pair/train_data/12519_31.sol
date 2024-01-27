contract c12519{
    // Mint RAcoin tokens for token sale participants and add them to Jackpot list
    // Using different types of minting functions has no effect on total limit of 20,000,000,000 RAC that can be created
    function mintTokensWithIncludingInJackpot(address _target, uint _mintedAmount) public onlyOwner returns (bool success) {
        require(maxAllowedManualDistribution > 0);
        if (mintTokens(_target, _mintedAmount)) {
            addAddressToJackpotParticipants(_target, _mintedAmount);
        }
        return true;
    }
}