contract c2013{
    /// @notice Allows configuration of the final parameters needed for
    /// auction end state calculation. This is only allowed once the auction
    /// has closed and no more bids can enter
    /// @param _min_share_price Minimum price accepted for individual asset shares
    /// @param _fundraise_max Maximum cap for fundraised capital
    function setFundraiseLimits(uint _min_share_price, uint _fundraise_max) public onlyOwner{
        require(!fundraise_defined);
        require(_min_share_price > 0);
        require(_fundraise_max > 0);
        require(status == state.ended);
        fundraise_max = _fundraise_max;
        min_share_price = _min_share_price;
        emit FundraiseDefined(min_share_price,fundraise_max);
        fundraise_defined = true;
    }
}