contract c18787{
    /**
    * @dev Set the Minimum of investment. 
    * @param _minWeiAmount Value in wei
    */
    function setMinAmount(uint256 _minWeiAmount)  public onlyOwner{
        require(_minWeiAmount > uint256(0));
        minWeiAmount = _minWeiAmount;
    }
}