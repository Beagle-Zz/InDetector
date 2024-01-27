contract c16197{
    /// Finalise purchase for address provided: transfers the tokens purchased by given participant to their address
    function finaliseAs(address _receiver)
        public
        when_not_halted
        when_ended
        only_investors(_receiver)
    {
        bool auctionParticipant;
        uint256 total;
        uint256 tokens;
        uint256 bonus;
        uint256 totalFixed;
        uint256 tokensFixed;
        // first time calling finalise after phase 2 has ended but target was not reached
        if (!campaignEnded) {
            campaignEnded = true;
            tokenContract.setTokenStart(endTime);
            Ended(false);
        }
        if (buyins[_receiver].accounted != 0) {
            auctionParticipant = true;
            total = buyins[_receiver].accounted;
            tokens = total.div(auctionEndPrice);
            if (auctionSuccessBonus > 0) {
                bonus = tokens.mul(auctionSuccessBonus).div(100);
            }
            totalFinalised = totalFinalised.add(total);
            delete buyins[_receiver];
        }
        if (purchases[_receiver] != 0) {
            totalFixed = purchases[_receiver];
            if (auctionParticipant) {
                tokensFixed = totalFixed.div(auctionEndPrice);
            }
            else {
                tokensFixed = totalFixed.div(fixedPrice);
            }
            totalFinalised = totalFinalised.add(totalFixed);
            delete purchases[_receiver];
        }
        tokens = tokens.add(bonus).add(tokensFixed);
        require (tokenContract.transferFrom(owner, _receiver, tokens));
        Finalised(_receiver, tokens);
        if (totalFinalised == totalAccounted) {
            tokenContract.burn(); // burn all unsold tokens
            Retired();
        }
    }
}