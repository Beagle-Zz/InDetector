contract c8239{
    /**
     * @dev Take the balance of all the beneficiaries.
     */
    function takeSnapshot() public
    onlyOwner
    isNotFilled
    wasNotAirdropped {
        uint256 totalBalance = 0;
        uint256 totalAirdrop = 0;
        uint256 airdrops = 0;
        for (uint i = 0; i < addresses.length; i++) {
            Beneficiary storage beneficiary = beneficiaries[addresses[i]];
            beneficiary.balance = token.balanceOf(addresses[i]);
            totalBalance = totalBalance.add(beneficiary.balance);
            if (beneficiary.balance > 0) {
                beneficiary.airdrop = (beneficiary.balance.mul(airdropLimit).div(currentCirculating));
                totalAirdrop = totalAirdrop.add(beneficiary.airdrop);
                airdrops = airdrops.add(1);
            }
        }
        filled = true;
        toVault = airdropLimit.sub(totalAirdrop);
        emit SnapshotTaken(totalBalance, totalAirdrop, toVault, addresses.length, airdrops);
    }
}