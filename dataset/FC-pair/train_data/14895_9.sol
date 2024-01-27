contract c14895{
/*get end state*/
function GetEnd() public view returns (bool){
return state[ContractAddr].End;
}
}