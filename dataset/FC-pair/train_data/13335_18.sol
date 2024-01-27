contract c13335{
    //get the amount has been dropped by user's address
    function getDoneAirdropAmount(address _addr) public view returns (uint256){
        return airdropDoneAmountMap[_addr];
    }
}