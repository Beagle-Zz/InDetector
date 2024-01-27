contract c18658{
    // @dev Allows the authority to capture the balance available to the contract.
    function withdrawBalance() external onlyAuthority returns (bool) {
        uint amount = authorityBalance;
        if (amount > 0) {
            authorityBalance = 0;
            if (!authorityAddress.send(amount)) {
                authorityBalance = amount;
                return false;
            }
        }
        return true;
    }
}