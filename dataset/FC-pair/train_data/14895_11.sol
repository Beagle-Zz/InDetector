contract c14895{
/*get toc price*/
function GetTocPrice() public view returns (uint256){
return market[ContractAddr].TocPrice;
}
}