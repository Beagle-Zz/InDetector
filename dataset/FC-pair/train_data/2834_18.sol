contract c2834{
      /// @return total amount of tokens
    function preMinedSupply() public view returns (uint256 supply){
        return _initialSupply;
    }
}