contract c4046{
    /**
    * @dev Register the address as a superinvestor address
    * @param _super Register the address as a superinvestor address   
    */
    function setSuperInvestor(address _super) external onlySuperOwner {
        superInvestor[_super] = true;
        emit TMTG_SetSuperInvestor(_super);
    }
}