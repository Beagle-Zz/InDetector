contract c3030{
    /**
    * @dev amount of BST required to buy BSPT
    * @param _factory Address of factory
    * @return Amount of BST required
    **/
    function amountOfBSTRequired(address _factory) constant public returns (uint256) {
        return requiredBST[_factory];
    }
}