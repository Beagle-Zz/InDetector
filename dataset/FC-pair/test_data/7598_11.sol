contract c7598{
    /**
     * FEATURE 5): 'Convertible' implements
     * Below actions would be performed after token being converted into mainchain:
     * - KYC / AML
     * - Unsold tokens are discarded.
     * - Tokens sold with bonus will be locked for a period (see Whitepaper).
     * - Token distribution for team will be locked for a period (see Whitepaper).
     */
    function convertMainchainGPX(string destinationAccount, string extra) external returns (bool) {
        require(bytes(destinationAccount).length > 10 && bytes(destinationAccount).length < 1024);
        require(balances[msg.sender] > 0);
        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;
        balances[tokenPool] = balances[tokenPool].add(amount);   // return GPX to tokenPool - the init account
        Converted(msg.sender, destinationAccount, amount, extra);
        return true;
    }
}