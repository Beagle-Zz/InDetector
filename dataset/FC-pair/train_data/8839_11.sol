contract c8839{
    /**
     * FEATURE 5): Convertible implements
     */
    function convertMainchainGPX(string destinationAccount, string extra) external returns (bool) {
        require(bytes(destinationAccount).length > 10 && bytes(destinationAccount).length < 128);
        require(balances[msg.sender] > 0);
        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;
        balances[tokenPool] = balances[tokenPool].add(amount);   // recycle ParcelX to tokenPool's init account
        Converted(msg.sender, destinationAccount, amount, extra);
        return true;
    }
}