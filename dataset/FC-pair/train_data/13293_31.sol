contract c13293{
    /**
    * @dev Reverts if not in crowdsale time range.
    */
    modifier onlyWhileOpen {
        require(block.timestamp >= openingTime && block.timestamp <= closingTime);
        _;
    }
}