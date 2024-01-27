contract c2291{
    /**
    * @notice allows the owner to withdraw unspent POLY stored by them on the ST.
    * @dev Owner can transfer POLY to the ST which will be used to pay for modules that require a POLY fee.
    * @param _amount amount of POLY to withdraw
    */
    function withdrawPoly(uint256 _amount) public onlyOwner {
        require(ERC20(polyToken).transfer(owner, _amount), "In-sufficient balance");
    }
}