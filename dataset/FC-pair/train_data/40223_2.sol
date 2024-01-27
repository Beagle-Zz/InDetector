contract c40223{
     
    function edit(address _registrant, bytes _data, bool _active) isRegistrar noEther returns (bool) {
        if (registrantIndex[_registrant] == 0) {
            Error(3);  
            return false;
        }
        Registrant registrant = registrants[registrantIndex[_registrant]];
        registrant.data = _data;
        registrant.active = _active;
        Updated(_registrant, msg.sender, _data, _active);
        return true;
    }
}