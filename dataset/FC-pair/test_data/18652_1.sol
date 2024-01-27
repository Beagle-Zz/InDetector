contract c18652{
    // View functions
    function getWeiBalance(address a) public view returns (uint) {
        return weiBalances[a];
    }
}