contract c217{
    /**
        @dev Transfers paladin ownership to a new address
        @param newPaladin the new address
    */
    function transferPaladinOwnership(address newPaladin) external 
    validAddress(newPaladin) {
        require(paladinAddress == msg.sender,"Not right role");
        _moveBalance(newPaladin);
        paladinAddress = newPaladin;
    }
}