contract c3030{
    /**
    * @dev check if address has enough BST to buy BSPT
    * @param _factory Address of factory
    * @param _address Address of BST owner
    * @return True if address has enough BST, false instead
    **/
    function hasEnoughBST(address _factory, address _address) constant public returns (bool) {
        return BST.balanceOf(_address) >= requiredBST[_factory];
    }
}