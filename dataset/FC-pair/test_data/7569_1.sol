contract c7569{
//get reserve information
function getReserve() external constant returns (uint256){
    address thissmart=this;
    return thissmart.balance;
}
}