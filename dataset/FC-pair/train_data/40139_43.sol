contract c40139{
     
    function timeTillNextAttack() constant internal returns(uint32){
        return (86400/(1+numAnimals/100));
    }
}