contract c40110{
     
    function remove(Data storage _data, address _item) {
        if (!_data.isContain[_item]) throw;
        var elemPrev = _data.prevOf[_item];
        var elemNext = _data.nextOf[_item];
        if (elemPrev != 0) {
            _data.nextOf[elemPrev] = elemNext;
        } else {
            _data.head = elemNext;
        }
        if (elemNext != 0) {
            _data.prevOf[elemNext] = elemPrev;
        } else {
            _data.tail = elemPrev;
        }
        _data.isContain[_item] = false;
        --_data.length;
    }
}