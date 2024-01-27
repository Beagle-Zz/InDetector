contract c10914{
    ///the Min Cap USD 
    ///function too chage the miin cap usd
    function changeMinCapUSD(uint256 _newMinCap) public onlyOwner{
        minCapUSD = _newMinCap;
    }
}