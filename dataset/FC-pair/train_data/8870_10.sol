contract c8870{
    /**
     * @dev Reset all the balances to 0 and the state to false.
     */
    function clean() public
    onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++)
        {
            Beneficiary storage beneficiary = beneficiaries[addresses[i]];
            beneficiary.balance = 0;
            beneficiary.airdrop = 0;
        }
        filled = false;
        airdropped = false;
        burn = 0;
        emit Cleaned(addresses.length);
    }
}