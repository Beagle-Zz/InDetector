contract c13952{
    // Creates a new game with the specified bet and current PayTable.
    // Does no validation of the _bet size.
    //
    // Gas Cost: 26k, 66k
    //   Overhead:
    //     - 20k: 1 writes: Game
    //     -  5k: 1 update: vars
    //     -  1k: SLOAD, execution
    //   New User:
    //     - 40k: 2 writes: userIds, userAddresses
    //   Repeat User:
    //     -  0k: nothing extra
    function _createNewGame(uint64 _bet)
        private
        returns (uint32 _curId)
    {
        // get or create user id
        uint32 _curUserId = vars.curUserId;
        uint32 _userId = userIds[msg.sender];
        if (_userId == 0) {
            _curUserId++;
            userIds[msg.sender] = _curUserId;
            userAddresses[_curUserId] = msg.sender;
            _userId = _curUserId;
        }
        // increment vars
        _curId =  vars.curId + 1;
        uint64 _totalWagered = vars.totalWageredGwei + _bet / 1e9;
        vars.curId = _curId;
        vars.totalWageredGwei = _totalWagered;
        vars.curUserId = _curUserId;
        // save game
        uint16 _payTableId = settings.curPayTableId;
        Game storage _game = games[_curId];
        _game.userId = _userId;
        _game.bet = _bet;
        _game.payTableId = _payTableId;
        _game.iBlock = uint32(block.number);
        return _curId;
    }
}