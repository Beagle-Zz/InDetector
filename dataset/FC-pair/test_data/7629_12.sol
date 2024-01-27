contract c7629{
// It returns the address of an active validator in the specific '_t' vector position of active validators 
// vector positions start at zero and ends at 'getQtyValidators - 1' so in order to get all vaidators 
// you have to iterate one by one from 0 to ' getQtyValidators -1 '
function getValidatorAddress(int _t) constant public returns (address _validatorAddr)
{
   int x = -1 ; 
   uint size = validatorsAcct.length ; 
   for ( uint i = 0 ; i < size ; i++ )
   {
      if ( validators[validatorsAcct[i]] ) x++ ; 
      if ( x == _t ) return (validatorsAcct[i]) ;  
   }
}
}