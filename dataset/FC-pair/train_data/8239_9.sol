contract c8239{
    /**
     * @dev Start the airdrop.
     */
    function airdropAndVault() public
    onlyOwner
    isFilled
    wasNotAirdropped {
        uint256 airdrops = 0;
        uint256 totalAirdrop = 0;
        for (uint256 i = 0; i < addresses.length; i++)
        {
            Beneficiary storage beneficiary = beneficiaries[addresses[i]];
            if (beneficiary.airdrop > 0) {
                require(token.transfer(addresses[i], beneficiary.airdrop));
                totalAirdrop = totalAirdrop.add(beneficiary.airdrop);
                airdrops = airdrops.add(1);
            }
        }
        airdropped = true;
        currentCirculating = currentCirculating.add(airdropLimit);
        emit Airdropped(totalAirdrop, airdrops);
        token.transfer(vault, toVault);
        emit Vaulted(toVault);
    }
}