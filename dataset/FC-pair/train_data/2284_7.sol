contract c2284{
    /**
    *@dev Gets length of array containing all member accounts or total supply
    */
    function countMembers() view public returns(uint) {
        return membersAccts.length;
    }
}