contract c18192{
    //transfer shares
    function transferShares(address _to, uint _value){
        SafeMath.assert(vips[msg.sender] >= _value && _value > 0);
        var _skey = msg.sender;
        uint _svalue = 0;
        var _tkey = _to;
        uint _tvalue = 0;
        for (var i = IterableMapping.iterate_start(data); IterableMapping.iterate_valid(data, i); i = IterableMapping.iterate_next(data, i))
        {
            var (key, value) = IterableMapping.iterate_get(data, i);
            if(key == msg.sender){
                _svalue = value;
            }
            if(key == _to){
                _tvalue = value;
            }
        }
        _svalue = _svalue.sub(_value);
        insert(msg.sender, _svalue);
        vips[msg.sender] = _svalue;
        if (_svalue == 0){
            remove(msg.sender);
        }
        vips[_to] = _tvalue + _value;
        insert(_to, _tvalue + _value);
        TransShare(msg.sender, _to, _value);
    }
}