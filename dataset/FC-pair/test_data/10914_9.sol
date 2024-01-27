contract c10914{
    ///fucntion to change the max cap usd
    function changeMaxCapUSD(uint256 _newMaxCap) public onlyOwner{
        maxCapUSD = _newMaxCap;
    }
}