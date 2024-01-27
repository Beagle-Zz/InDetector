contract c18133{
    /// @dev filter buyers in list buyers
    /// @param isInvestor type buyers, is investor or not
    function filterBuyers(bool isInvestor)
    private
    constant
    returns(address[] filterList){
        address[] memory filterTmp = new address[](buyers.length);
        uint count = 0;
        for (uint i = 0; i < buyers.length; i++){
            if(approvedInvestorList[buyers[i]] == isInvestor){
                filterTmp[count] = buyers[i];
                count++;
            }
        }
        filterList = new address[](count);
        for (i = 0; i < count; i++){
            if(filterTmp[i] != 0x0){
                filterList[i] = filterTmp[i];
            }
        }
    }
}