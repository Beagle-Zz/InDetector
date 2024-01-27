contract c10096{
    // Interface functions to allow specifying ICAP addresses as strings.
    function transferToICAP(string _icap, uint _value) returns(bool) {
        return transferToICAPWithReference(_icap, _value, '');
    }
}