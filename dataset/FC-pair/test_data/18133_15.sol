contract c18133{
    /// @dev filter buyers are investor in list deposited
    function getInvestorBuyers()
    public
    constant
    returns(address[]){
        return filterBuyers(true);
    }
}