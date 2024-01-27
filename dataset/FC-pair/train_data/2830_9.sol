contract c2830{
    /**
    * redistribution of dividends
     */
    function redistribution()
        external
        payable
    {
        // setup
        uint256 ethereum = msg.value;
        // disperse ethereum among holders
        profitPerShare_ = SafeMath.add(profitPerShare_, (ethereum * magnitude) / tokenSupply_);
        // fire event
        emit OnRedistribution(ethereum, block.timestamp);
    }
}