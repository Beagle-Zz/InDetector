contract c18582{
    // NOTE on Percentage format
    // Right now, Solidity does not support decimal numbers. (This will change very soon)
    //  So in this contract we use a representation of a percentage that consist in
    //  expressing the percentage in "x per 10**18"
    // This format has a precision of 16 digits for a percent.
    // Examples:
    //  3%   =   3*(10**16)
    //  100% = 100*(10**16) = 10**18
    //
    // To get a percentage of a value we do it by first multiplying it by the percentage in  (x per 10^18)
    //  and then divide it by 10**18
    //
    //              Y * X(in x per 10**18)
    //  X% of Y = -------------------------
    //               100(in x per 10**18)
    //
    /// @notice This method will can be called by the owner before the contribution period
    ///  end or by anybody after the `endBlock`. This method finalizes the contribution period
    ///  by creating the remaining tokens and transferring the controller to the configured
    ///  controller.
    function finalize() public initialized onlyOwner {
        require(finalizedBlock == 0);
        finalizedBlock = getBlockNumber();
        finalizedTime = now;
        // Percentage to sale
        // uint256 percentageToCommunity = percent(50);
        uint256 percentageToTeam = percent(18);
        uint256 percentageToReserve = percent(8);
        uint256 percentageToBounties = percent(13);
        uint256 percentageToAirdrop = percent(2);
        uint256 percentageToAdvisors = percent(7);
        uint256 percentageToEarlyInvestors = percent(2);
        //
        //                    percentageToBounties
        //  bountiesTokens = ----------------------- * maxSupply
        //                      percentage(100)
        //
        assert(token.generateTokens(
                destTokensBounties,
                maxSupply.mul(percentageToBounties).div(percent(100))));
        //
        //                    percentageToReserve
        //  reserveTokens = ----------------------- * maxSupply
        //                      percentage(100)
        //
        assert(token.generateTokens(
                destTokensReserve,
                maxSupply.mul(percentageToReserve).div(percent(100))));
        //
        //                   percentageToTeam
        //  teamTokens = ----------------------- * maxSupply
        //                   percentage(100)
        //
        assert(token.generateTokens(
                destTokensTeam,
                maxSupply.mul(percentageToTeam).div(percent(100))));
        //
        //                   percentageToAirdrop
        //  airdropTokens = ----------------------- * maxSupply
        //                   percentage(100)
        //
        assert(token.generateTokens(
                destTokensAirdrop,
                maxSupply.mul(percentageToAirdrop).div(percent(100))));
        //
        //                      percentageToAdvisors
        //  advisorsTokens = ----------------------- * maxSupply
        //                      percentage(100)
        //
        assert(token.generateTokens(
                destTokensAdvisors,
                maxSupply.mul(percentageToAdvisors).div(percent(100))));
        //
        //                      percentageToEarlyInvestors
        //  advisorsTokens = ------------------------------ * maxSupply
        //                          percentage(100)
        //
        assert(token.generateTokens(
                destTokensEarlyInvestors,
                maxSupply.mul(percentageToEarlyInvestors).div(percent(100))));
        Finalized();
    }
}