contract c2284{
    /**
    *@dev getter function to get all membersAccts
    */
    function getMembers() view public returns (address[]){
        return membersAccts;
    }
}