contract c12016{
    /// @dev Refund bet manually if oraclize callback was not received
    /// @param _flipId Targeted flip
    function refundFlip(bytes32 _flipId) external {
        require(msg.sender == flips[_flipId].owner || msg.sender == owner, "Refund caller is not owner of this flip.");
        require(!flips[_flipId].completed, "Trying to refund completed flip.");
        flips[_flipId].completed = true;
        if(flips[_flipId].currency == BetCurrency.ETH) {
            // Return ether if ether was used to bet for flip
            flips[_flipId].owner.transfer(flips[_flipId].betETH);
        }
        else {
            // Return tokens if tokens were used to bet for flip
            assert(token.transfer(flips[_flipId].owner, flips[_flipId].betTokens));
        }
        tokensRequiredForAllWins = tokensRequiredForAllWins.sub(flips[_flipId].betTokens.mul(flips[_flipId].numberOfCoinSides));
        flips[_flipId].status = FlipStatus.Refunded;
        emit FlipEnded(_flipId, flips[_flipId].owner, flips[_flipId].winTokens);
    }
}