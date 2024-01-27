contract c13332{
    /**
     * `tokenDistributor` is authorized to distribute tokens to the parties who participated in the token sale by the
     * time the `lastMint` function is triggered, which closes the ability to mint any new tokens forever.
     * @param recipients - Addresses of token recipients
     * @param amounts - Corresponding amount of each token recipient in `recipients`
     */
    function multiMint (address[] recipients, uint256[] amounts) external {
        // Once the token distribution ends, tokenDistributor will become 0x0 and multiMint will never work
        require(tokenDistributor != 0x0 && tokenDistributor == msg.sender && recipients.length == amounts.length);
        uint total = 0;
        for (uint i = 0; i < recipients.length; ++i) {
            balanceOf[recipients[i]] += amounts[i];
            total += amounts[i];
            emit Transfer(0x0, recipients[i], amounts[i]);
        }
        totalSupply += total;
    }
}