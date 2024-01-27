contract c7628{
// consensus obtained it is true if and only if n+1 validators voted affirmatively for a proposal 
// where n == the total qty. of validators (qtyValidators)
function isConsensusObtained(uint _totalAffirmativeVotes) constant public returns (bool)
{
 // multiplying by 10000 (10 thousand) for decimal precision management
 // note: This scales up to 9999 validators only
 require (qtyValidators > 0) ; // prevents division by zero 
 uint dTotalVotes = _totalAffirmativeVotes * 10000 ; 
 return (dTotalVotes / qtyValidators > 5000 ) ;
}
}