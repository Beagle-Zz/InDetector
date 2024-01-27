contract c14895{
/*get main sale state*/
function GetMainSale() public view returns (bool){
return state[ContractAddr].MainSale;
}
}