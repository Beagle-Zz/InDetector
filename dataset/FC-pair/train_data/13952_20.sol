contract c13952{
    // Allows admin to permanently add a PayTable (once per day)
    function addPayTable(
        uint16 _rf, uint16 _sf, uint16 _fk, uint16 _fh,
        uint16 _fl, uint16 _st, uint16 _tk, uint16 _tp, uint16 _jb
    )
        public
        fromAdmin
    {
        uint32 _today = uint32(block.timestamp / 1 days);
        require(settings.lastDayAdded < _today);
        settings.lastDayAdded = _today;
        _addPayTable(_rf, _sf, _fk, _fh, _fl, _st, _tk, _tp, _jb);
        emit PayTableAdded(now, msg.sender, settings.numPayTables-1);
    }
}