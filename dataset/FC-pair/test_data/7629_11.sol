contract c7629{
// returns the total quantity of active validators
// only 'active' ones quantity  
function getQtyValidators() constant public returns (uint)
{
  return qtyValidators ; 
}
}