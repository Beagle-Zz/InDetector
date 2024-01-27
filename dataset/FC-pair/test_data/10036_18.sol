contract c10036{
     /**
     * function to withdraw FoundersTeamAndAdvisors funds to the owner wallet
     * can only be called from owner wallet
     **/
    function withdrawFoundersTeamAndAdvisors() public onlyOwner {
        require (FoundersTeamAndAdvisorsAccumulated > 0);
        owner.transfer(FoundersTeamAndAdvisorsAccumulated);
        FoundersTeamAndAdvisorsAccumulated = 0;
    }
}