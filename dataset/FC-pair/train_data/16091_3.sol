contract c16091{
    //function to allocate tokens for a set of contributors
    function allocateTokens(address[] _contributors) external {
        for (uint256 i = 0; i < _contributors.length; i++) {
            sale.allocateTokens(_contributors[i]);
        }
    }
}