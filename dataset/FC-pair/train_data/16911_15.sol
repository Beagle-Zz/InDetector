contract c16911{
    /**
    * owner withdraw token reserved from comission
    */
    function WithdrawAllReserves() onlyOwner public {
        //eth
        uint256 x = _systemReserves[0x0];
        if(x > 0 && x <= address(this).balance) {
            _systemReserves[0x0] = 0;
            msg.sender.transfer( _systemReserves[0x0] );
        }
        //tokens
        address ta;
        EIP20Interface token;
        for(uint256 i = 0; i < _listedReserves.length; i++) {
            ta = _listedReserves[i];
            if(_systemReserves[ta] > 0)
            { 
                x = _systemReserves[ta];
                _systemReserves[ta] = 0;
                token = EIP20Interface(ta);
                token.transfer(msg.sender, x);
            }
        } 
        _listedReserves.length = 0; 
    }
}