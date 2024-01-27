contract c13744{
    // this is a seperate function so user could query it before crowdsale starts
    function contributorMinCap( address contributor ) public constant returns(uint) {
        return list.getMinCap( contributor );
    }
}