contract c8926{
    /**
     * `tokenDistributor` is authorized to distribute tokens to the parties who participated in the token sale by the
     * time the `lastMint` function is triggered, which closes the ability to mint any new tokens forever.
     * Once the token distribution event ends (lastMint is triggered), tokenDistributor will become 0x0 and multiMint
     * function will never work again.
     * @param recipients - addresses of token recipients
     * @param amounts - corresponding amount of each token recipient in `recipients`
     */
    function multiMint (address[] recipients, uint256[] amounts) external tokenDistributionPeriodOnly {
        require(recipients.length == amounts.length);
        uint total = 0;
        for (uint i = 0; i < recipients.length; ++i) {
            balanceOf[recipients[i]] = balanceOf[recipients[i]].add(amounts[i]);
            total = total.add(amounts[i]);
            emit Transfer(0x0, recipients[i], amounts[i]);
        }
        totalSupply = totalSupply.add(total);
    }
}