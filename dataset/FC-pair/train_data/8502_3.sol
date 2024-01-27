contract c8502{
     //Lottery's divs
    function myDividends() public view returns(uint256)
    {
        return poohContract.myDividends(true);
    }
}