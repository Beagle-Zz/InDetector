contract c10241{
    // @return true if the transaction can buy tokens
    function validPurchase() internal constant returns (bool) 
    {
        // check validity of purchase
        if(msg.value.div(weiPerAnimal)<1)
            return false;
        uint quotient=msg.value.div(weiPerAnimal); 
        uint actualVal=quotient.mul(weiPerAnimal);
        if(msg.value>actualVal)
            return false;
        else 
            return true;
    }
}