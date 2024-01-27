contract c8502{
    //Number of POOH tokens currently in the Lottery pool
    function myTokens() public view returns(uint256)
    {
        return poohContract.myTokens();
    }
}