contract c16875{
    /**
     * Withdraw the earned Dividends to Ether
     *  - Includes Torch + Token Dividends and Token Referral Bonuses
     */
    function withdrawDividends() public returns (uint256) {
        CryptoTorchToken_.withdrawFor(msg.sender);
        return withdrawFor_(msg.sender);
    }
}