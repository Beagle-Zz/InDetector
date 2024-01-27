contract c40564{
     
    function multiplierFactor() constant returns (uint factor, string info) {
        factor = multiplier;
        info = 'The current multiplier applied to all deposits. Min 110%, max 150%.'; 
    }
}