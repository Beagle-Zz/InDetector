contract c13744{
    // an optimization in case of network congestion
    function listAddresses( address[] _users, uint[] _mincap, uint[] _maxcap ) public  onlyOwner {
        require(_users.length == _mincap.length );
        require(_users.length == _maxcap.length );
        for( uint i = 0 ; i < _users.length ; i++ ) {
            listAddress( _users[i], _mincap[i], _maxcap[i] );
        }
    }
}