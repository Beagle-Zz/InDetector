contract c40224{
     
    function add(address _registrant, bytes _data) isRegistrar noEther returns (bool) {
        if (registrantIndex[_registrant] > 0) {
            Error(2);  
            return false;
        }
        uint pos = registrants.length++;
        registrants[pos] = Registrant(_registrant, _data, true);
        registrantIndex[_registrant] = pos;
        Created(_registrant, msg.sender, _data);
        return true;
    }
}