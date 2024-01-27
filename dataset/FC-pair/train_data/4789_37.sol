contract c4789{
    /**
     * @dev Reverts if not in crowdsale time range.
     */
    modifier onlyWhileOpen {
        require(isPresale() || isSale());
        _;
    }
}