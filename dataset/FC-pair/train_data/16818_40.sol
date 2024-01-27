contract c16818{
    /**
     * Get the Max Price of the Torch during the Anti-Whale Phase
     */
    function getMaxPrice() public view returns (uint256) {
        if (whaleIncreaseLimit == 0) { return 0; }  // no max price
        return whaleIncreaseLimit.add(_highestPrices[0].price);
    }
}